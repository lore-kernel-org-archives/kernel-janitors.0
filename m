From: Kulikov Vasiliy <segooon@gmail.com>
Date: Thu, 15 Jul 2010 06:42:51 +0000
Subject: [PATCH 09/11] staging: comedi: formatting of pointers in printk()
Message-Id: <1279176172-5609-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Dominik Brodowski <linux@dominikbrodowski.net>, Alexander Kurz <linux@kbdbabel.org>, Jiri Kosina <jkosina@suse.cz>, Javier Martinez Canillas <martinez.javier@gmail.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Use %p instead of %08x in printk().

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/staging/comedi/drivers/quatech_daqp_cs.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/comedi/drivers/quatech_daqp_cs.c b/drivers/staging/comedi/drivers/quatech_daqp_cs.c
index 8d16380..8b49cb1 100644
--- a/drivers/staging/comedi/drivers/quatech_daqp_cs.c
+++ b/drivers/staging/comedi/drivers/quatech_daqp_cs.c
@@ -208,7 +208,7 @@ static void hex_dump(char *str, void *ptr, int len)
 
 	for (i = 0; i < len; i++) {
 		if (i % 16 = 0)
-			printk("\n0x%08x:", (unsigned int)cptr);
+			printk("\n%p:", cptr);
 
 		printk(" %02x", *(cptr++));
 	}
-- 
1.7.0.4

