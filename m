From: Julia Lawall <julia@diku.dk>
Date: Tue, 26 Feb 2008 20:43:56 +0000
Subject: [PATCH 5/9] drivers/media/video/em28xx: Correct use of.and &
Message-Id: <Pine.LNX.4.64.0802262143320.18200@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mchehab@infradead.org, v4l-dvb-maintainer@linuxtv.org, video4linux-list@redhat.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

In commit e6bafba5b4765a5a252f1b8d31cbf6d2459da337, a bug was fixed that
involved converting !x & y to !(x & y).  The code below shows the same
pattern, and thus should perhaps be fixed in the same way.

This is not tested and clearly changes the semantics, so it is only
something to consider.

The semantic patch that makes this change is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@ expression E1,E2; @@
(
  !E1 & !E2
|
- !E1 & E2
+ !(E1 & E2)
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---

diff -u -p a/drivers/media/video/em28xx/em28xx-core.c b/drivers/media/video/em28xx/em28xx-core.c
--- a/drivers/media/video/em28xx/em28xx-core.c 2008-02-20 22:09:26.000000000 +0100
+++ b/drivers/media/video/em28xx/em28xx-core.c 2008-02-26 08:05:10.000000000 +0100
@@ -267,7 +267,7 @@ static int em28xx_write_ac97(struct em28
 	for (i = 0; i < 10; i++) {
 		if ((ret = em28xx_read_reg(dev, AC97BUSY_REG)) < 0)
 			return ret;
-		if (!((u8) ret) & 0x01)
+		if (!(((u8)ret) & 0x01))
 			return 0;
 		msleep(5);
 	}
