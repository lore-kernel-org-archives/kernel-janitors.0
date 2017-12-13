From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 13 Dec 2017 13:14:26 +0000
Subject: [PATCH 4/4] staging/wlan-ng/prism2fw: Use common error handling code in writeimage()
Message-Id: <73da6cfc-5534-556d-3d3c-542cc31e8eef@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3599ae76-1aa8-4b6a-bf31-90e467759629@users.sourceforge.net>
In-Reply-To: <3599ae76-1aa8-4b6a-bf31-90e467759629@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Maciek Borzecki <maciek.borzecki@gmail.com>, Simo Koskinen <koskisoft@gmail.com>, Thibaut Sautereau <thibaut.sautereau@telecom-sudparis.eu>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 13 Dec 2017 13:41:41 +0100

Replace two calls of the function "kfree" by a jump to the same statements
at the end of this function so that the generated object code could become
a bit smaller.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/staging/wlan-ng/prism2fw.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/wlan-ng/prism2fw.c b/drivers/staging/wlan-ng/prism2fw.c
index e6f7ed17106a..42ad5ff7772e 100644
--- a/drivers/staging/wlan-ng/prism2fw.c
+++ b/drivers/staging/wlan-ng/prism2fw.c
@@ -1012,9 +1012,8 @@ static int writeimage(struct wlandevice *wlandev, struct imgchunk *fchunk,
 	rstmsg = kzalloc(sizeof(*rstmsg), GFP_KERNEL);
 	rwrmsg = kzalloc(sizeof(*rwrmsg), GFP_KERNEL);
 	if (!rstmsg || !rwrmsg) {
-		kfree(rstmsg);
-		kfree(rwrmsg);
-		return -ENOMEM;
+		result = -ENOMEM;
+		goto free_result;
 	}
 
 	/* Initialize the messages */
-- 
2.15.1

