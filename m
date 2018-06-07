From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 07 Jun 2018 13:17:14 +0000
Subject: [PATCH] typec: tcpm: Fix a msecs vs jiffies bug
Message-Id: <20180607131714.hjpd7xdhcpzntkob@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Guenter Roeck <groeck@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

The tcpm_set_state() function take msecs not jiffies.

Fixes: f0690a25a140 ("staging: typec: USB Type-C Port Manager (tcpm)")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/typec/tcpm.c b/drivers/usb/typec/tcpm.c
index 8a201dd53d36..0dfd755020f4 100644
--- a/drivers/usb/typec/tcpm.c
+++ b/drivers/usb/typec/tcpm.c
@@ -3043,7 +3043,8 @@ static void run_state_machine(struct tcpm_port *port)
 		    tcpm_port_is_sink(port) &&
 		    time_is_after_jiffies(port->delayed_runtime)) {
 			tcpm_set_state(port, SNK_DISCOVERY,
-				       port->delayed_runtime - jiffies);
+				       jiffies_to_msecs(port->delayed_runtime -
+							jiffies));
 			break;
 		}
 		tcpm_set_state(port, unattached_state(port), 0);
