From: Colin King <colin.king@canonical.com>
Date: Fri, 26 Jan 2018 15:39:00 +0000
Subject: [PATCH] USB: gadget: function: remove redundant initialization of 'tv_nexus'
Message-Id: <20180126153900.6946-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer tv_nexus is being initialized a value and this is never read
and is later being updated with the same value. Remove the redundant
initialization so that the assignment to tv_nexus is performed later
and more local to when it is being read.

Cleans up clang warning:
drivers/usb/gadget/function/f_tcm.c:1097:25: warning: Value stored to
'tv_nexus' during its initialization is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/gadget/function/f_tcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/function/f_tcm.c
index da81cf16b850..d78dbb73bde8 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -1094,7 +1094,7 @@ static int usbg_submit_command(struct f_uas *fu,
 	struct command_iu *cmd_iu = cmdbuf;
 	struct usbg_cmd *cmd;
 	struct usbg_tpg *tpg = fu->tpg;
-	struct tcm_usbg_nexus *tv_nexus = tpg->tpg_nexus;
+	struct tcm_usbg_nexus *tv_nexus;
 	u32 cmd_len;
 	u16 scsi_tag;
 
-- 
2.15.1

