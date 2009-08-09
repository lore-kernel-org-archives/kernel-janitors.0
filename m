From: Julia Lawall <julia@diku.dk>
Date: Sun, 09 Aug 2009 12:44:41 +0000
Subject: Re: [PATCH 1/3] drivers/isdn/hisax: Correct use of
Message-Id: <Pine.LNX.4.64.0908091444020.16252@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0908090942560.13271@ask.diku.dk>
 <Pine.LNX.4.64.0908091150310.13271@ask.diku.dk> <200908091420.33935.isdn@linux-pingi.de>
In-Reply-To: <200908091420.33935.isdn@linux-pingi.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Karsten Keil <isdn@linux-pingi.de>
Cc: isdn4linux@listserv.isdn4linux.de, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

request_mem_region should be used when ioremap is used subsequently.
In this case, release_mem_region was already used where needed.

The semantic patch that fixes this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression start,E;
@@

- request_region
+ request_mem_region
    (start,...)
  ... when != request_mem_region(start,...)
      when != start = E
  ioremap(start,...)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/isdn/hisax/isurf.c          |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/isdn/hisax/isurf.c b/drivers/isdn/hisax/isurf.c
index ca41617..e1c3434 100644
--- a/drivers/isdn/hisax/isurf.c
+++ b/drivers/isdn/hisax/isurf.c
@@ -259,7 +259,8 @@ setup_isurf(struct IsdnCard *card)
 			cs->hw.isurf.reset);
 			return (0);
 	}
-	if (!request_region(cs->hw.isurf.phymem, ISURF_IOMEM_SIZE, "isurf iomem")) {
+	if (!request_mem_region(cs->hw.isurf.phymem, ISURF_IOMEM_SIZE,
+				"isurf iomem")) {
 		printk(KERN_WARNING "HiSax: Siemens I-Surf memory region "
 			"%lx-%lx already in use\n",
 			cs->hw.isurf.phymem,
