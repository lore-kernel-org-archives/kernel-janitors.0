From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 14 Jun 2017 09:10:56 +0000
Subject: [PATCH] Staging: rtl8723bs: fix an error code in isFileReadable()
Message-Id: <20170614091055.GB29394@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The caller only cares about zero vs non-zero so this code actually works
fine but we should be returning a negative error code instead of a valid
pointer casted to int.

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/rtl8723bs/os_dep/osdep_service.c b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
index 02db59e8b593..aa16d1ab955b 100644
--- a/drivers/staging/rtl8723bs/os_dep/osdep_service.c
+++ b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
@@ -160,7 +160,7 @@ static int isFileReadable(char *path)
 		oldfs = get_fs(); set_fs(get_ds());
 
 		if (1!=readFile(fp, &buf, 1))
-			ret = PTR_ERR(fp);
+			ret = -EINVAL;
 
 		set_fs(oldfs);
 		filp_close(fp, NULL);
