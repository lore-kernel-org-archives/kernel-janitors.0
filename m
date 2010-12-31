From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Fri, 31 Dec 2010 09:19:24 +0000
Subject: [PATCH 4/4] staging: keucr: Delete use kernel strcmp() & strcpy() from TODO file
Message-Id: <1293787164-7056-5-git-send-email-martinez.javier@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
---
 drivers/staging/keucr/TODO |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/keucr/TODO b/drivers/staging/keucr/TODO
index 29f1b10..179b7fe 100644
--- a/drivers/staging/keucr/TODO
+++ b/drivers/staging/keucr/TODO
@@ -7,8 +7,7 @@ TODO:
 	  infrastructure instead.
 	- review by the USB developer community
 	- common.h: use kernel swap, le, & be functions
-	- smcommon.h & smilsub.c: use kernel hweight8(), hweight16(),
-		strcmp(), & strcpy()
+	- smcommon.h & smilsub.c: use kernel hweight8(), hweight16()
 
 Please send any patches for this driver to Al Cho <acho@novell.com> and
 Greg Kroah-Hartman <gregkh@suse.de>.
-- 
1.7.0.4

