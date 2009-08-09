From: Julia Lawall <julia@diku.dk>
Date: Sun, 09 Aug 2009 07:43:20 +0000
Subject: [PATCH 1/3] drivers/isdn/hisax: Correct use of request_region/request_mem_region
Message-Id: <Pine.LNX.4.64.0908090942560.13271@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Karsten Keil <isdn@linux-pingi.de>, isdn4linux@listserv.isdn4linux.de, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

request_region should be used with release_region, not request_mem_region.

The semantic patch that fixes this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@r1@
expression start;
@@

request_region(start,...)

@b1@
expression r1.start;
@@

request_mem_region(start,...)

@depends on !b1@
expression r1.start;
expression E;
@@

- release_mem_region
+ release_region
  (start,E)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/isdn/hisax/isurf.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/drivers/isdn/hisax/isurf.c b/drivers/isdn/hisax/isurf.c
--- a/drivers/isdn/hisax/isurf.c
+++ b/drivers/isdn/hisax/isurf.c
@@ -125,7 +125,7 @@ release_io_isurf(struct IsdnCardState *c
 {
 	release_region(cs->hw.isurf.reset, 1);
 	iounmap(cs->hw.isurf.isar);
-	release_mem_region(cs->hw.isurf.phymem, ISURF_IOMEM_SIZE);
+	release_region(cs->hw.isurf.phymem, ISURF_IOMEM_SIZE);
 }
 
 static void
