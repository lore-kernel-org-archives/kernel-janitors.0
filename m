From: Julia Lawall <julia@diku.dk>
Date: Fri, 02 Apr 2010 12:47:38 +0000
Subject: [PATCH 2/3] drivers/mtd/maps: Eliminate use after free
Message-Id: <Pine.LNX.4.64.1004021447160.17695@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Moved the debugging message before the call to map_destroy, which frees its
argument.  The message is also slightly changed to reflect its new
position.

A simplified version of the semantic patch that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression E,E2;
@@

del_mtd_device(E)
...
(
  E = E2
|
* E
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/mtd/maps/pcmciamtd.c        |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/maps/pcmciamtd.c b/drivers/mtd/maps/pcmciamtd.c
index 87b2b8f..3e339de 100644
--- a/drivers/mtd/maps/pcmciamtd.c
+++ b/drivers/mtd/maps/pcmciamtd.c
@@ -689,8 +689,8 @@ static void pcmciamtd_detach(struct pcmcia_device *link)
 
 	if(dev->mtd_info) {
 		del_mtd_device(dev->mtd_info);
+		info("mtd%d: Removing", dev->mtd_info->index);
 		map_destroy(dev->mtd_info);
-		info("mtd%d: Removed", dev->mtd_info->index);
 	}
 
 	pcmciamtd_release(link);
