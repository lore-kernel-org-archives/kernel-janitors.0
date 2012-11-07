From: Kumar Amit Mehta <gmate.amit@gmail.com>
Date: Wed, 07 Nov 2012 12:08:09 +0000
Subject: [PATCH] staging: comedi: drivers: jr3_pci.c: fix for coding style issue
Message-Id: <1352290089-14477-1-git-send-email-gmate.amit@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: abbotti@mev.co.uk
Cc: fmhess@users.sourceforge.net, gregkh@linuxfoundation.org, hsweeten@visionengravers.com, ravishankar.km@greenturtles.in, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

fixed few error and warning messages as reported by checkpatch.pl

Signed-off-by: Kumar Amit Mehta <gmate.amit@gmail.com>
---
 drivers/staging/comedi/drivers/jr3_pci.c |    9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/comedi/drivers/jr3_pci.c b/drivers/staging/comedi/drivers/jr3_pci.c
index 364541d..20fdb7b 100644
--- a/drivers/staging/comedi/drivers/jr3_pci.c
+++ b/drivers/staging/comedi/drivers/jr3_pci.c
@@ -360,7 +360,7 @@ static int read_idm_word(const u8 *data, size_t size, int *pos,
 	return result;
 }
 
-static int jr3_download_firmware(struct comedi_device *dev, const u8 * data,
+static int jr3_download_firmware(struct comedi_device *dev, const u8 *data,
 				 size_t size)
 {
 	/*
@@ -470,14 +470,13 @@ static struct poll_delay_t jr3_pci_poll_subdevice(struct comedi_subdevice *s)
 		struct jr3_channel __iomem *channel = p->channel;
 		int errors = get_u16(&channel->errors);
 
-		if (errors != p->errors) {
+		if (errors != p->errors)
 			p->errors = errors;
-		}
-		if (errors & (watch_dog | watch_dog2 | sensor_change)) {
+
+		if (errors & (watch_dog | watch_dog2 | sensor_change))
 			/*  Sensor communication lost, force poll mode */
 			p->state = state_jr3_poll;
 
-		}
 		switch (p->state) {
 		case state_jr3_poll: {
 				u16 model_no = get_u16(&channel->model_no);
-- 
1.7.9.5

