From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 09 Jan 2018 18:33:27 +0000
Subject: [PATCH 5/5] misc/pti: Delete an unnecessary return statement in two functions
Message-Id: <2741f1bd-ba63-8ff6-e88b-4084ac608b65@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <bd359852-a809-280d-3d52-89216edc2058@users.sourceforge.net>
In-Reply-To: <bd359852-a809-280d-3d52-89216edc2058@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 9 Jan 2018 18:52:36 +0100

The script "checkpatch.pl" pointed information out like the following.

WARNING: void function return statements are not generally useful

Thus remove such a statement in the affected functions.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/misc/pti.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/misc/pti.c b/drivers/misc/pti.c
index 11d92c3f43ba..7f9235e56cc0 100644
--- a/drivers/misc/pti.c
+++ b/drivers/misc/pti.c
@@ -142,7 +142,6 @@ static void pti_write_to_aperture(struct pti_masterchannel *mc,
 		ptiword |= *p++ << (24-(8*i));
 
 	iowrite32(ptiword, aperture);
-	return;
 }
 
 /**
@@ -390,5 +389,4 @@ void pti_writedata(struct pti_masterchannel *mc, u8 *buf, int count)
 		pti_write_to_aperture(mc, buf, count);
-	return;
 }
 EXPORT_SYMBOL_GPL(pti_writedata);
 
-- 
2.15.1

