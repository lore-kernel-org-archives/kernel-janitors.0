From: Christoph Fritz <chf.fritz@googlemail.com>
Date: Tue, 29 Nov 2011 21:00:16 +0000
Subject: [PATCH] usb: gadget: f_mass_storage: common->curlun could be NULL
Message-Id: <1322600416.2182.48.camel@mars>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This patch adds a NULL check for common->curlun in case of an unknown_cmnd
in do_scsi_command(). 

Signed-off-by: Christoph Fritz <chf.fritz@googlemail.com>
---
 drivers/usb/gadget/f_mass_storage.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/usb/gadget/f_mass_storage.c b/drivers/usb/gadget/f_mass_storage.c
index c39d588..0e42027 100644
--- a/drivers/usb/gadget/f_mass_storage.c
+++ b/drivers/usb/gadget/f_mass_storage.c
@@ -2184,7 +2184,8 @@ unknown_cmnd:
 		reply = check_command(common, common->cmnd_size,
 				      DATA_DIR_UNKNOWN, 0xff, 0, unknown);
 		if (reply = 0) {
-			common->curlun->sense_data = SS_INVALID_COMMAND;
+			if (common->curlun)
+				common->curlun->sense_data = SS_INVALID_COMMAND;
 			reply = -EINVAL;
 		}
 		break;
-- 
1.7.2.5


