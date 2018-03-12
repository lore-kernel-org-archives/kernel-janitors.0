From: Colin King <colin.king@canonical.com>
Date: Mon, 12 Mar 2018 23:36:05 +0000
Subject: [PATCH] staging: comedi: adl_pci6208: remove redundant initialization of 'val'
Message-Id: <20180312233605.8643-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ian Abbott <abbotti@mev.co.uk>, H Hartley Sweeten <hsweeten@visionengravers.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable 'val' is initialized with a value that is never read, it is
updated with a new value again after intitialization. Remove the
redundant initialization and move the declaration and assignment into
the scope of the for-loop.

Cleans up clang warning:
drivers/staging/comedi/drivers/adl_pci6208.c:61:15: warning: Value
stored to 'val' during its initialization is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/comedi/drivers/adl_pci6208.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/comedi/drivers/adl_pci6208.c b/drivers/staging/comedi/drivers/adl_pci6208.c
index d39b4eabce8d..e21840e9002d 100644
--- a/drivers/staging/comedi/drivers/adl_pci6208.c
+++ b/drivers/staging/comedi/drivers/adl_pci6208.c
@@ -58,12 +58,11 @@ static int pci6208_ao_insn_write(struct comedi_device *dev,
 				 unsigned int *data)
 {
 	unsigned int chan = CR_CHAN(insn->chanspec);
-	unsigned int val = s->readback[chan];
 	int ret;
 	int i;
 
 	for (i = 0; i < insn->n; i++) {
-		val = data[i];
+		unsigned int val = data[i];
 
 		/* D/A transfer rate is 2.2us */
 		ret = comedi_timeout(dev, s, insn, pci6208_ao_eoc, 0);
-- 
2.15.1

