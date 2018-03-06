From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 06 Mar 2018 09:58:03 +0000
Subject: [PATCH] ipmi: missing error code in try_smi_init()
Message-Id: <20180306095803.GA10474@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

If platform_device_alloc() then we should return -ENOMEM instead of
returning success.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/char/ipmi/ipmi_si_intf.c b/drivers/char/ipmi/ipmi_si_intf.c
index f2a294f78892..ff870aa91cfe 100644
--- a/drivers/char/ipmi/ipmi_si_intf.c
+++ b/drivers/char/ipmi/ipmi_si_intf.c
@@ -2071,6 +2071,7 @@ static int try_smi_init(struct smi_info *new_smi)
 						      new_smi->intf_num);
 		if (!new_smi->pdev) {
 			pr_err(PFX "Unable to allocate platform device\n");
+			rv = -ENOMEM;
 			goto out_err;
 		}
 		new_smi->io.dev = &new_smi->pdev->dev;
