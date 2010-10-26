From: Julia Lawall <julia@diku.dk>
Date: Tue, 26 Oct 2010 10:25:36 +0000
Subject: [PATCH 7/14] drivers/net/typhoon.c: delete double assignment
Message-Id: <1288088743-3725-8-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1288088743-3725-1-git-send-email-julia@diku.dk>
In-Reply-To: <1288088743-3725-1-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Dillow <dave@thedillows.org>
Cc: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Delete successive assignments to the same location.  The current definition
does not initialize the respRing structure, which has the same type as the
cmdRing structure, so initialize that one instead.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression i;
@@

*i = ...;
 i = ...;
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
This changes the semantics and has not been tested.

 drivers/net/typhoon.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/typhoon.c b/drivers/net/typhoon.c
index 1cc6713..fc014eb 100644
--- a/drivers/net/typhoon.c
+++ b/drivers/net/typhoon.c
@@ -1328,7 +1328,7 @@ typhoon_init_rings(struct typhoon *tp)
 	tp->rxHiRing.lastWrite = 0;
 	tp->rxBuffRing.lastWrite = 0;
 	tp->cmdRing.lastWrite = 0;
-	tp->cmdRing.lastWrite = 0;
+	tp->respRing.lastWrite = 0;
 
 	tp->txLoRing.lastRead = 0;
 	tp->txHiRing.lastRead = 0;

