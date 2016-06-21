From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 21 Jun 2016 11:46:21 +0000
Subject: [patch] staging: comedi: dt2811: fix a precedence bug
Message-Id: <20160621114621.GB16941@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Bitwise | has higher precedence than ?: so we need to add some
parenthesis for this to work as intended.

Fixes: 7c9574090d30 ('staging: comedi: dt2811: simplify A/D reference configuration')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/comedi/drivers/dt2811.c b/drivers/staging/comedi/drivers/dt2811.c
index 904f6377..8bbd938 100644
--- a/drivers/staging/comedi/drivers/dt2811.c
+++ b/drivers/staging/comedi/drivers/dt2811.c
@@ -588,8 +588,8 @@ static int dt2811_attach(struct comedi_device *dev, struct comedi_devconfig *it)
 	s = &dev->subdevices[0];
 	s->type		= COMEDI_SUBD_AI;
 	s->subdev_flags	= SDF_READABLE |
-			  (it->options[2] = 1) ? SDF_DIFF :
-			  (it->options[2] = 2) ? SDF_COMMON : SDF_GROUND;
+			  ((it->options[2] = 1) ? SDF_DIFF :
+			   (it->options[2] = 2) ? SDF_COMMON : SDF_GROUND);
 	s->n_chan	= (it->options[2] = 1) ? 8 : 16;
 	s->maxdata	= 0x0fff;
 	s->range_table	= board->is_pgh ? &dt2811_pgh_ai_ranges
