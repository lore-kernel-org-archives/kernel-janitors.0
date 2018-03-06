From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 06 Mar 2018 10:40:11 +0000
Subject: [PATCH v2] ipmi: Fix error code in try_smi_init()
Message-Id: <20180306104011.GA22441@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

If platform_device_alloc() fails, then we should return -ENOMEM instead
of returning success.  I've also removed the "rv" initialization so that
GCC can maybe detect if we forget to set it in the future.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: Don't initialize "rv" and fix a typo in the commit message

diff --git a/drivers/char/ipmi/ipmi_si_intf.c b/drivers/char/ipmi/ipmi_si_intf.c
index f2a294f78892..c09b279cd55e 100644
--- a/drivers/char/ipmi/ipmi_si_intf.c
+++ b/drivers/char/ipmi/ipmi_si_intf.c
@@ -2026,7 +2026,7 @@ int ipmi_si_add_smi(struct si_sm_io *io)
  */
 static int try_smi_init(struct smi_info *new_smi)
 {
-	int rv = 0;
+	int rv;
 	int i;
 	char *init_name = NULL;
 
@@ -2071,6 +2071,7 @@ static int try_smi_init(struct smi_info *new_smi)
 						      new_smi->intf_num);
 		if (!new_smi->pdev) {
 			pr_err(PFX "Unable to allocate platform device\n");
+			rv = -ENOMEM;
 			goto out_err;
 		}
 		new_smi->io.dev = &new_smi->pdev->dev;
