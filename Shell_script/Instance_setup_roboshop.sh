
#!/bin/bash

# Define the Amazon Machine Image (AMI) ID
# AMI is a template that contains the operating system and necessary software
# Ideally, this should be updated dynamically if the AMI changes often.
AMI="ami-0f3c7d07486cad139"  # Replace with your own AMI ID

# Define the Security Group ID
# The security group controls inbound and outbound traffic to/from the EC2 instances.
SG_ID="sg-087e7afb3a936fce7" # Replace with your own Security Group ID

# List of service names (e.g., MongoDB, Redis, MySQL, etc.)
# These will be used to tag the EC2 instances and to create corresponding DNS records.
INSTANCES=("mongodb" "redis" "mysql" "rabbitmq" "catalogue" "user" "cart" "shipping" "payment" "dispatch" "web")

# The Route 53 hosted zone ID where DNS records will be created/updated.
# You must replace this with your own hosted zone ID.
ZONE_ID="Z104317737D96UJVA7NEF"  # Replace with your own hosted zone ID

# Your domain name. This will be used to form the full DNS names for each service.
DOMAIN_NAME="daws76s.online"

# Loop through the list of services (each service will correspond to an EC2 instance)
for i in "${INSTANCES[@]}"
do
    # Choose the instance type based on the service
    # Some services (like databases) might need more resources, so we use a larger instance type (t3.small)
    if [[ $i == "mongodb" || $i == "mysql" || $i == "shipping" ]]; then
        INSTANCE_TYPE="t3.small"  # More resource-intensive services
    else
        INSTANCE_TYPE="t2.micro"  # Smaller instance for less resource-demanding services
    fi

    # Run EC2 instance using the specified AMI, instance type, and security group
    # We also add a tag with the service name to easily identify the instance
    IP_ADDRESS=$(aws ec2 run-instances \
        --image-id $AMI \  # Specify the AMI to launch the instance from
        --instance-type $INSTANCE_TYPE \  # Specify the type of instance (e.g., t3.small or t2.micro)
        --security-group-ids $SG_ID \  # Specify the Security Group ID for the instance
        --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$i}]" \  # Tag the instance with its service name
        --query 'Instances[0].PrivateIpAddress' \  # Get the private IP address of the newly launched instance
        --output text)  # Output the result as plain text (no JSON formatting)

    # Print the service name and its private IP address for debugging purposes
    # This helps to confirm that the instance was launched and the IP was correctly fetched
    echo "$i: $IP_ADDRESS"  # Debugging output

    # Create or update a DNS record in Route 53 for this service
    # We use the `UPSERT` action to either create or update the record if it already exists
    aws route53 change-resource-record-sets \
    --hosted-zone-id $ZONE_ID \  # Specify the hosted zone ID for your domain
    --change-batch '{
        "Comment": "Creating or updating a record set for '"$i"'",  # Provide a comment describing the change
        "Changes": [{
            "Action": "UPSERT",  # Action to either update or create the record
            "ResourceRecordSet": {
                "Name": "'"$i"'.$DOMAIN_NAME'",  # Form the DNS name by appending the service name to the domain
                "Type": "A",  # Type of DNS record (A record for mapping to IP address)
                "TTL": 60,  # Time-to-Live in seconds (how long the record is cached by resolvers)
                "ResourceRecords": [{
                    "Value": "'"$IP_ADDRESS"'"  # Set the value of the record to the instance's private IP
                }]
            }
        }]
    }'
done
