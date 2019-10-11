From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 11 Oct 2019 13:35:58 +0000
Subject: [PATCH] usb: typec: fix an IS_ERR() vs NULL bug in hd3ss3220_probe()
Message-Id: <20191011133558.GC22905@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Biju Das <biju.das@bp.renesas.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

The device_get_named_child_node() function doesn't return error
pointers, it returns NULL on error.

Fixes: 1c48c759ef4b ("usb: typec: driver for TI HD3SS3220 USB Type-C DRP port controller")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/usb/typec/hd3ss3220.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
index 9715600aeb04..37b08f57aac4 100644
--- a/drivers/usb/typec/hd3ss3220.c
+++ b/drivers/usb/typec/hd3ss3220.c
@@ -172,8 +172,8 @@ static int hd3ss3220_probe(struct i2c_client *client,
 	hd3ss3220_set_source_pref(hd3ss3220,
 				  HD3SS3220_REG_GEN_CTRL_SRC_PREF_DRP_DEFAULT);
 	connector = device_get_named_child_node(hd3ss3220->dev, "connector");
-	if (IS_ERR(connector))
-		return PTR_ERR(connector);
+	if (!connector)
+		return -EIO;
 
 	hd3ss3220->role_sw = fwnode_usb_role_switch_get(connector);
 	fwnode_handle_put(connector);
-- 
2.20.1
