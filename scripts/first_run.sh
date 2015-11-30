#!/bin/bash
USER=${RABBITMQ_USERNAME:-rabbitmq}
PASS=${RABBITMQ_PASSWORD:-$(pwgen -s -1 16)}
VHOST=${RABBITMQ_VHOST:-/}

# Create User
echo "Creating user: \"$USER\"..."
cat > /etc/rabbitmq/rabbitmq.config <<EOF
[
	{rabbit, [{default_user, <<"$USER">>},{default_pass, <<"$PASS">>},{default_vhost, <<"$VHOST">>},{tcp_listeners, [{"0.0.0.0", 5672}]}]}
].
EOF

echo "========================================================================"
echo "RabbitMQ User: \"$USER\""
echo "RabbitMQ Password: \"$PASS\""
echo "RabbitMQ Virtual Host: \"$VHOST\""
echo "========================================================================"

rm -f /.firstrun
