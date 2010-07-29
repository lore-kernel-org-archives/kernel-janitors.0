From: Dan Carpenter <error27@gmail.com>
Date: Thu, 29 Jul 2010 08:50:14 +0000
Subject: [patch] tmp_atmel: request correct region
Message-Id: <20100729085014.GT26313@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Debora Velarde <debora@linux.vnet.ibm.com>
Cc: Rajiv Andrade <srajiv@linux.vnet.ibm.com>, Marcel Selhorst <m.selhorst@sirrix.com>, tpmdd-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We wanted to request "base".  "tpm_atmel.base" is zero here.  This bug
was introduced by e0dd03caf20d "[PATCH] tpm: return chip from
tpm_register_hardware".

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
Found with a static checker.  I don't have the hardware to test this.

diff --git a/drivers/char/tpm/tpm_atmel.c b/drivers/char/tpm/tpm_atmel.c
index c64a1bc..090b3ec 100644
--- a/drivers/char/tpm/tpm_atmel.c
+++ b/drivers/char/tpm/tpm_atmel.c
@@ -205,7 +205,7 @@ static int __init init_atmel(void)
 
 	have_region  	    (atmel_request_region
-	     (tpm_atmel.base, region_size, "tpm_atmel0") = NULL) ? 0 : 1;
+	     (base, region_size, "tpm_atmel0") = NULL) ? 0 : 1;
 
 	pdev = platform_device_register_simple("tpm_atmel", -1, NULL, 0);
 	if (IS_ERR(pdev)) {
