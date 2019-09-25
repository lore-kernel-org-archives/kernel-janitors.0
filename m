From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 25 Sep 2019 11:02:19 +0000
Subject: [PATCH] usb: typec: tcpm: Fix a signedness bug in tcpm_fw_get_caps()
Message-Id: <20190925110219.GN3264@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Guenter Roeck <linux@roeck-us.net>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The "port->typec_caps.data" and "port->typec_caps.type" variables are
enums and in this context GCC will treat them as an unsigned int so they
can never be less than zero.

Fixes: ae8a2ca8a221 ("usb: typec: Group all TCPCI/TCPM code together")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 96562744101c..d3b63e000ae2 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -4410,7 +4410,7 @@ static int tcpm_fw_get_caps(struct tcpm_port *port,
 	ret = fwnode_property_read_string(fwnode, "data-role", &cap_str);
 	if (ret = 0) {
 		port->typec_caps.data = typec_find_port_data_role(cap_str);
-		if (port->typec_caps.data < 0)
+		if ((int)port->typec_caps.data < 0)
 			return -EINVAL;
 	}
 
@@ -4419,7 +4419,7 @@ static int tcpm_fw_get_caps(struct tcpm_port *port,
 		return ret;
 
 	port->typec_caps.type = typec_find_port_power_role(cap_str);
-	if (port->typec_caps.type < 0)
+	if ((int)port->typec_caps.type < 0)
 		return -EINVAL;
 	port->port_type = port->typec_caps.type;
 
-- 
2.20.1
