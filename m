From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 13 Dec 2017 13:13:37 +0000
Subject: [PATCH 3/4] staging/wlan-ng/prism2fw: Delete an error message for a failed memory allocation in writ
Message-Id: <191428e7-b3e7-a089-a93d-98bfd50494eb@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3599ae76-1aa8-4b6a-bf31-90e467759629@users.sourceforge.net>
In-Reply-To: <3599ae76-1aa8-4b6a-bf31-90e467759629@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Maciek Borzecki <maciek.borzecki@gmail.com>, Simo Koskinen <koskisoft@gmail.com>, Thibaut Sautereau <thibaut.sautereau@telecom-sudparis.eu>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 13 Dec 2017 13:28:15 +0100

Omit an extra message for a memory allocation failure in this function.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/staging/wlan-ng/prism2fw.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/wlan-ng/prism2fw.c b/drivers/staging/wlan-ng/prism2fw.c
index efca9108dad8..e6f7ed17106a 100644
--- a/drivers/staging/wlan-ng/prism2fw.c
+++ b/drivers/staging/wlan-ng/prism2fw.c
@@ -1014,9 +1014,6 @@ static int writeimage(struct wlandevice *wlandev, struct imgchunk *fchunk,
 	if (!rstmsg || !rwrmsg) {
 		kfree(rstmsg);
 		kfree(rwrmsg);
-		netdev_err(wlandev->netdev,
-			   "%s: no memory for firmware download, aborting download\n",
-			   __func__);
 		return -ENOMEM;
 	}
 
-- 
2.15.1

