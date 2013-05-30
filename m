From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 30 May 2013 08:00:34 +0000
Subject: [patch] Staging: crystalhd: remove an unneeded NULL check
Message-Id: <20130530080034.GB8148@debian>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We already established earlier in the function that "temp" is
non-NULL.  We also don't need to set to NULL because it's a stack
variable an we return immediately.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/crystalhd/crystalhd_lnx.c b/drivers/staging/crystalhd/crystalhd_lnx.c
index 284b61f..c1f6163 100644
--- a/drivers/staging/crystalhd/crystalhd_lnx.c
+++ b/drivers/staging/crystalhd/crystalhd_lnx.c
@@ -255,10 +255,7 @@ static int chd_dec_api_cmd(struct crystalhd_adp *adp, unsigned long ua,
 		rc = chd_dec_proc_user_data(adp, temp, ua, 1);
 	}
 
-	if (temp) {
-		chd_dec_free_iodata(adp, temp, 0);
-		temp = NULL;
-	}
+	chd_dec_free_iodata(adp, temp, 0);
 
 	return rc;
 }
