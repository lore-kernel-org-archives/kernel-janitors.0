From: Julia Lawall <julia@diku.dk>
Date: Thu, 06 Mar 2008 17:24:05 +0000
Subject: [PATCH] arch/cris: Use mutex_unlock rather than spin_unlock
Message-Id: <Pine.LNX.4.58.0803061823370.1669@pc-041.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: starvik@axis.com, jesper.nilsson@axis.com, dev-etrax@axis.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

It looks at least odd to apply spin_unlock to a mutex.

The semantic patch that makes this change is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@def@
declarer DEFINE_MUTEX;
identifier m;
@@

DEFINE_MUTEX(m);

@@
identifier def.m;
@@

(
- spin_lock(&m)
+ mutex_lock(&m)
|
- spin_unlock(&m)
+ mutex_unlock(&m)
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 arch/cris/arch-v10/drivers/pcf8563.c |    2 +-
 arch/cris/arch-v32/drivers/pcf8563.c |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff -u -p a/arch/cris/arch-v10/drivers/pcf8563.c b/arch/cris/arch-v10/drivers/pcf8563.c
--- a/arch/cris/arch-v10/drivers/pcf8563.c 2008-02-10 22:34:04.000000000 +0100
+++ b/arch/cris/arch-v10/drivers/pcf8563.c 2008-03-05 22:06:18.000000000 +0100
@@ -233,7 +233,7 @@ int pcf8563_ioctl(struct inode *inode, s

 		if (copy_to_user((struct rtc_time *) arg, &tm,
 				 sizeof tm)) {
-			spin_unlock(&rtc_lock);
+			mutex_unlock(&rtc_lock);
 			return -EFAULT;
 		}

diff -u -p a/arch/cris/arch-v32/drivers/pcf8563.c b/arch/cris/arch-v32/drivers/pcf8563.c
--- a/arch/cris/arch-v32/drivers/pcf8563.c 2008-02-10 22:34:04.000000000 +0100
+++ b/arch/cris/arch-v32/drivers/pcf8563.c 2008-03-05 22:06:18.000000000 +0100
@@ -229,7 +229,7 @@ int pcf8563_ioctl(struct inode *inode, s

 		if (copy_to_user((struct rtc_time *) arg, &tm,
 				 sizeof tm)) {
-			spin_unlock(&rtc_lock);
+			mutex_unlock(&rtc_lock);
 			return -EFAULT;
 		}

