From: Colin King <colin.king@canonical.com>
Date: Wed, 11 Jul 2018 10:32:29 +0000
Subject: [PATCH] staging: comedi: remove redundant variable segpos
Message-Id: <20180711103229.30066-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ian Abbott <abbotti@mev.co.uk>, H Hartley Sweeten <hsweeten@visionengravers.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable segpos is being assigned but is never used hence it is redundant
and can be removed.

Cleans up clang warning:
warning: variable 'segpos' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/comedi/drivers/pcl816.c | 4 ++--
 drivers/staging/comedi/drivers/pcl818.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/comedi/drivers/pcl816.c b/drivers/staging/comedi/drivers/pcl816.c
index d722079f3327..d87cf6d4a161 100644
--- a/drivers/staging/comedi/drivers/pcl816.c
+++ b/drivers/staging/comedi/drivers/pcl816.c
@@ -282,7 +282,7 @@ static int check_channel_list(struct comedi_device *dev,
 			      unsigned int chanlen)
 {
 	unsigned int chansegment[16];
-	unsigned int i, nowmustbechan, seglen, segpos;
+	unsigned int i, nowmustbechan, seglen;
 
 	/*  correct channel and range number check itself comedi/range.c */
 	if (chanlen < 1) {
@@ -312,7 +312,7 @@ static int check_channel_list(struct comedi_device *dev,
 		}
 
 		/*  check whole chanlist */
-		for (i = 0, segpos = 0; i < chanlen; i++) {
+		for (i = 0; i < chanlen; i++) {
 			if (chanlist[i] != chansegment[i % seglen]) {
 				dev_dbg(dev->class_dev,
 					"bad channel or range number! chanlist[%i]=%d,%d,%d and not %d,%d,%d!\n",
diff --git a/drivers/staging/comedi/drivers/pcl818.c b/drivers/staging/comedi/drivers/pcl818.c
index eebb49751713..0af5315d4357 100644
--- a/drivers/staging/comedi/drivers/pcl818.c
+++ b/drivers/staging/comedi/drivers/pcl818.c
@@ -573,7 +573,7 @@ static int check_channel_list(struct comedi_device *dev,
 			      unsigned int *chanlist, unsigned int n_chan)
 {
 	unsigned int chansegment[16];
-	unsigned int i, nowmustbechan, seglen, segpos;
+	unsigned int i, nowmustbechan, seglen;
 
 	/* correct channel and range number check itself comedi/range.c */
 	if (n_chan < 1) {
@@ -605,7 +605,7 @@ static int check_channel_list(struct comedi_device *dev,
 		}
 
 		/*  check whole chanlist */
-		for (i = 0, segpos = 0; i < n_chan; i++) {
+		for (i = 0; i < n_chan; i++) {
 			if (chanlist[i] != chansegment[i % seglen]) {
 				dev_dbg(dev->class_dev,
 					"bad channel or range number! chanlist[%i]=%d,%d,%d and not %d,%d,%d!\n",
-- 
2.17.1

