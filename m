From: YueHaibing <yuehaibing@huawei.com>
Date: Sat, 06 Apr 2019 02:57:04 +0000
Subject: [PATCH -next] staging: comedi: dyna_pci10xx: remove set but not used variables 'chan' and range'
Message-Id: <20190406030749.56659-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ian Abbott <abbotti@mev.co.uk>, H Hartley Sweeten <hsweeten@visionengravers.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sanjana Sanikommu <sanjana99reddy99@gmail.com>
Cc: YueHaibing <yuehaibing@huawei.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/staging/comedi/drivers/dyna_pci10xx.c: In function 'dyna_pci10xx_insn_write_ao':
drivers/staging/comedi/drivers/dyna_pci10xx.c:109:21: warning:
 variable 'range' set but not used [-Wunused-but-set-variable]
  unsigned int chan, range;

drivers/staging/comedi/drivers/dyna_pci10xx.c:109:15: warning:
 variable 'chan' set but not used [-Wunused-but-set-variable]
  unsigned int chan, range;

They are never used since introduction in commit 16a7373a8e14 ("Staging:
comedi: add dyna_pci10xx driver")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/staging/comedi/drivers/dyna_pci10xx.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/comedi/drivers/dyna_pci10xx.c b/drivers/staging/comedi/drivers/dyna_pci10xx.c
index 9bdd5bf2eb99..d38bfc6113e8 100644
--- a/drivers/staging/comedi/drivers/dyna_pci10xx.c
+++ b/drivers/staging/comedi/drivers/dyna_pci10xx.c
@@ -106,10 +106,6 @@ static int dyna_pci10xx_insn_write_ao(struct comedi_device *dev,
 {
 	struct dyna_pci10xx_private *devpriv = dev->private;
 	int n;
-	unsigned int chan, range;
-
-	chan = CR_CHAN(insn->chanspec);
-	range = range_codes_pci1050_ai[CR_RANGE((insn->chanspec))];
 
 	mutex_lock(&devpriv->mutex);
 	for (n = 0; n < insn->n; n++) {
