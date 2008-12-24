From: Julia Lawall <julia@diku.dk>
Date: Wed, 24 Dec 2008 15:24:05 +0000
Subject: [PATCH 3/3] drivers/staging/rt2860,rt2870: Correct use of.and &
Message-Id: <Pine.LNX.4.64.0812241623380.5475@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@suse.de, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

IW_ENCODE_MODE is 0xF000 and thus !erq->flags & IW_ENCODE_MODE is always 0.
I assume that !(erq->flags & IW_ENCODE_MODE) was intended.

The semantic patch that makes this change is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@ expression E; constant C; @@
(
  !E & !C
|
- !E & C
+ !(E & C)
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/staging/rt2860/sta_ioctl.c |    2 +-
 drivers/staging/rt2870/sta_ioctl.c |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff -u -p a/drivers/staging/rt2860/sta_ioctl.c b/drivers/staging/rt2860/sta_ioctl.c
--- a/drivers/staging/rt2860/sta_ioctl.c
+++ b/drivers/staging/rt2860/sta_ioctl.c
@@ -1756,7 +1756,7 @@ int rt_ioctl_siwencode(struct net_device
             }
         else
 			/* Don't complain if only change the mode */
-			if(!erq->flags & IW_ENCODE_MODE) {
+			if (!(erq->flags & IW_ENCODE_MODE)) {
 				return -EINVAL;
 		}
 	}
diff -u -p a/drivers/staging/rt2870/sta_ioctl.c b/drivers/staging/rt2870/sta_ioctl.c
--- a/drivers/staging/rt2870/sta_ioctl.c
+++ b/drivers/staging/rt2870/sta_ioctl.c
@@ -1776,7 +1776,7 @@ int rt_ioctl_siwencode(struct net_device
             }
         else
 			/* Don't complain if only change the mode */
-			if(!erq->flags & IW_ENCODE_MODE) {
+			if (!(erq->flags & IW_ENCODE_MODE)) {
 				return -EINVAL;
 		}
 	}
