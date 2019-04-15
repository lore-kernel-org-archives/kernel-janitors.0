From: Colin King <colin.king@canonical.com>
Date: Mon, 15 Apr 2019 17:49:45 +0000
Subject: [PATCH] staging: comedi: adv_pci1710: fix spelling mistake: "droput" -> "dropout"
Message-Id: <20190415174945.32712-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ian Abbott <abbotti@mev.co.uk>, H Hartley Sweeten <hsweeten@visionengravers.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_error message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/comedi/drivers/adv_pci1710.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/comedi/drivers/adv_pci1710.c b/drivers/staging/comedi/drivers/adv_pci1710.c
index 6a93b04f1fdf..dbff0f7e7cf5 100644
--- a/drivers/staging/comedi/drivers/adv_pci1710.c
+++ b/drivers/staging/comedi/drivers/adv_pci1710.c
@@ -317,7 +317,7 @@ static int pci1710_ai_read_sample(struct comedi_device *dev,
 		chan = sample >> 12;
 		if (chan != devpriv->act_chanlist[cur_chan]) {
 			dev_err(dev->class_dev,
-				"A/D data droput: received from channel %d, expected %d\n",
+				"A/D data dropout: received from channel %d, expected %d\n",
 				chan, devpriv->act_chanlist[cur_chan]);
 			return -ENODATA;
 		}
-- 
2.20.1
