From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 23 Oct 2020 11:24:12 +0000
Subject: [PATCH 2/2] usb: typec: stusb160x: fix some signedness bugs
Message-Id: <20201023112412.GD282278@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Amelie Delaunay <amelie.delaunay@st.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

These variables are enums but in this situation GCC will treat them as
unsigned so the conditions are never true.

Fixes: da0cb6310094 ("usb: typec: add support for STUSB160x Type-C controller family")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/usb/typec/stusb160x.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/stusb160x.c b/drivers/usb/typec/stusb160x.c
index f7369e371dd4..da7f1957bcb3 100644
--- a/drivers/usb/typec/stusb160x.c
+++ b/drivers/usb/typec/stusb160x.c
@@ -545,7 +545,7 @@ static int stusb160x_get_fw_caps(struct stusb160x *chip,
 	ret = fwnode_property_read_string(fwnode, "power-role", &cap_str);
 	if (!ret) {
 		chip->port_type = typec_find_port_power_role(cap_str);
-		if (chip->port_type < 0) {
+		if ((int)chip->port_type < 0) {
 			ret = chip->port_type;
 			return ret;
 		}
@@ -567,9 +567,10 @@ static int stusb160x_get_fw_caps(struct stusb160x *chip,
 	if (!ret) {
 		chip->pwr_opmode = typec_find_pwr_opmode(cap_str);
 		/* Power delivery not yet supported */
-		if (chip->pwr_opmode < 0 ||
+		if ((int)chip->pwr_opmode < 0 ||
 		    chip->pwr_opmode = TYPEC_PWR_MODE_PD) {
-			ret = chip->pwr_opmode < 0 ? chip->pwr_opmode : -EINVAL;
+			ret = (int)chip->pwr_opmode < 0 ? chip->pwr_opmode :
+							  -EINVAL;
 			dev_err(chip->dev, "bad power operation mode: %d\n",
 				chip->pwr_opmode);
 			return ret;
-- 
2.28.0
