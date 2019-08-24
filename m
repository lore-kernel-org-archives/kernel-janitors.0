From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 24 Aug 2019 14:51:47 +0000
Subject: [PATCH] ipmi_ssif: Fix locking on probe error path
Message-Id: <20190824145147.GB5337@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

If the allocations failed then we returned with the lock held.  This
patch moves the allocations infront of the locking.

Fixes: 714acbc6cc39 ("ipmi_ssif: avoid registering duplicate ssif interface")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/char/ipmi/ipmi_ssif.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/char/ipmi/ipmi_ssif.c b/drivers/char/ipmi/ipmi_ssif.c
index 205726926bd3..9cf2efd33f19 100644
--- a/drivers/char/ipmi/ipmi_ssif.c
+++ b/drivers/char/ipmi/ipmi_ssif.c
@@ -1683,7 +1683,6 @@ static int ssif_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	u8		  slave_addr = 0;
 	struct ssif_addr_info *addr_info = NULL;
 
-	mutex_lock(&ssif_infos_mutex);
 	resp = kmalloc(IPMI_MAX_MSG_LENGTH, GFP_KERNEL);
 	if (!resp)
 		return -ENOMEM;
@@ -1694,6 +1693,8 @@ static int ssif_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		return -ENOMEM;
 	}
 
+	mutex_lock(&ssif_infos_mutex);
+
 	if (!check_acpi(ssif_info, &client->dev)) {
 		addr_info = ssif_info_find(client->addr, client->adapter->name,
 					   true);
-- 
2.20.1
