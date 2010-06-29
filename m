From: Kulikov Vasiliy <segooon@gmail.com>
Date: Tue, 29 Jun 2010 10:15:47 +0000
Subject: [PATCH 14/25] cx25821-alsa: remove casts from void*
Message-Id: <1277806548-31180-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kernel Janitors <kernel-janitors@vger.kernel.org>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Mauro Carvalho Chehab <mchehab@redhat.com>, Olimpiu Pascariu <olimpiu.pascariu@gmail.com>, Tejun Heo <tj@kernel.org>, Palash Bandyopadhyay <palash.bandyopadhyay@conexant.com>, sai gopal <tsg321@gmail.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Remove unnesessary casts from void*.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/staging/cx25821/cx25821-alsa.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/cx25821/cx25821-alsa.c b/drivers/staging/cx25821/cx25821-alsa.c
index 1798975..ce2c6f1 100644
--- a/drivers/staging/cx25821/cx25821-alsa.c
+++ b/drivers/staging/cx25821/cx25821-alsa.c
@@ -699,7 +699,7 @@ static int cx25821_audio_initdev(struct cx25821_dev *dev)
 
 	/* Card "creation" */
 	card->private_free = snd_cx25821_dev_free;
-	chip = (struct cx25821_audio_dev *) card->private_data;
+	chip = card->private_data;
 	spin_lock_init(&chip->reg_lock);
 
 	chip->dev = dev;
-- 
1.7.0.4

