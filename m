From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 23 Oct 2020 11:23:47 +0000
Subject: [PATCH 1/2] usb: typec: stusb160x: fix an IS_ERR() vs NULL check in probe
Message-Id: <20201023112347.GC282278@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Amelie Delaunay <amelie.delaunay@st.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

The typec_register_port() function doesn't return error pointers, it
returns error pointers.

Fixes: da0cb6310094 ("usb: typec: add support for STUSB160x Type-C controller family")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/usb/typec/stusb160x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/stusb160x.c b/drivers/usb/typec/stusb160x.c
index ce0bd7b3ad88..f7369e371dd4 100644
--- a/drivers/usb/typec/stusb160x.c
+++ b/drivers/usb/typec/stusb160x.c
@@ -729,8 +729,8 @@ static int stusb160x_probe(struct i2c_client *client)
 	}
 
 	chip->port = typec_register_port(chip->dev, &chip->capability);
-	if (!chip->port) {
-		ret = -ENODEV;
+	if (IS_ERR(chip->port)) {
+		ret = PTR_ERR(chip->port);
 		goto all_reg_disable;
 	}
 
-- 
2.28.0
