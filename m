From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 12 Jul 2017 07:51:33 +0000
Subject: [PATCH] staging: rtl8188eu: memory leak in rtw_free_cmd_obj()
Message-Id: <20170712075133.l6js4fd2xtaork3t@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We were fixing checkpatch.pl warnings and accidentally reversed this
condition.

Fixes: 5b29aaaa1e3c ("staging: rtl8188eu: removes comparison to null")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/rtl8188eu/core/rtw_cmd.c b/drivers/staging/rtl8188eu/core/rtw_cmd.c
index 002d09159896..a69007ef77bf 100644
--- a/drivers/staging/rtl8188eu/core/rtw_cmd.c
+++ b/drivers/staging/rtl8188eu/core/rtw_cmd.c
@@ -132,7 +132,7 @@ void rtw_free_cmd_obj(struct cmd_obj *pcmd)
 		kfree(pcmd->parmbuf);
 	}
 
-	if (!pcmd->rsp) {
+	if (pcmd->rsp) {
 		if (pcmd->rspsz != 0) {
 			/* free rsp in cmd_obj */
 			kfree(pcmd->rsp);
