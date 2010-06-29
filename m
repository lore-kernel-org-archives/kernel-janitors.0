From: Kulikov Vasiliy <segooon@gmail.com>
Date: Tue, 29 Jun 2010 10:15:36 +0000
Subject: [PATCH 11/25] pcm3724: remove casts from void*
Message-Id: <1277806537-31078-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kernel Janitors <kernel-janitors@vger.kernel.org>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Benjamin Adolphi <b.adolphi@gmail.com>, Mithlesh Thukral <mithlesh@linsyssoft.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Remove unnesessary casts from void*.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/staging/comedi/drivers/pcm3724.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/comedi/drivers/pcm3724.c b/drivers/staging/comedi/drivers/pcm3724.c
index ed61030..0e91d95 100644
--- a/drivers/staging/comedi/drivers/pcm3724.c
+++ b/drivers/staging/comedi/drivers/pcm3724.c
@@ -184,7 +184,7 @@ static void enable_chan(struct comedi_device *dev, struct comedi_subdevice *s,
 	struct priv_pcm3724 *priv;
 
 	gatecfg = 0;
-	priv = (struct priv_pcm3724 *)(dev->private);
+	priv = dev->private;
 
 	mask = 1 << CR_CHAN(chanspec);
 	if (s = dev->subdevices)	/*  subdev 0 */
-- 
1.7.0.4

