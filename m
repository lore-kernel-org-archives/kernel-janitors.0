From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 29 Aug 2013 21:45:06 +0000
Subject: [patch] staging: r8188eu: off by one bugs
Message-Id: <20130829214506.GA23197@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

These should be "<" instead of "<=".  Also we can use the ARRAY_SIZE()
macro.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/rtl8188eu/core/rtw_cmd.c b/drivers/staging/rtl8188eu/core/rtw_cmd.c
index 859fc19..9632ef4 100644
--- a/drivers/staging/rtl8188eu/core/rtw_cmd.c
+++ b/drivers/staging/rtl8188eu/core/rtw_cmd.c
@@ -367,7 +367,7 @@ _next:
 
 		memcpy(pcmdbuf, pcmd->parmbuf, pcmd->cmdsz);
 
-		if (pcmd->cmdcode <= (sizeof(wlancmds) / sizeof(struct cmd_hdl))) {
+		if (pcmd->cmdcode < ARRAY_SIZE(wlancmds)) {
 			cmd_hdl = wlancmds[pcmd->cmdcode].h2cfuns;
 
 			if (cmd_hdl) {
@@ -385,7 +385,7 @@ _next:
 post_process:
 
 		/* call callback function for post-processed */
-		if (pcmd->cmdcode <= (sizeof(rtw_cmd_callback) / sizeof(struct _cmd_callback))) {
+		if (pcmd->cmdcode < ARRAY_SIZE(rtw_cmd_callback)) {
 			pcmd_callback = rtw_cmd_callback[pcmd->cmdcode].callback;
 			if (pcmd_callback = NULL) {
 				RT_TRACE(_module_rtl871x_cmd_c_, _drv_info_, ("mlme_cmd_hdl(): pcmd_callback = 0x%p, cmdcode = 0x%x\n", pcmd_callback, pcmd->cmdcode));
