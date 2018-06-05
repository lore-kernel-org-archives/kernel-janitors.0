From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 05 Jun 2018 09:36:30 +0000
Subject: [PATCH] staging: comedi: quatech_daqp_cs: fix no-op loop daqp_ao_insn_write()
Message-Id: <20180605093630.x3izv3uusspez52n@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

There is a '>' vs '<' typo so this loop is a no-op.

Fixes: d35dcc89fc93 ("staging: comedi: quatech_daqp_cs: fix daqp_ao_insn_write()")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/comedi/drivers/quatech_daqp_cs.c b/drivers/staging/comedi/drivers/quatech_daqp_cs.c
index ea194aa01a64..257b0daff01f 100644
--- a/drivers/staging/comedi/drivers/quatech_daqp_cs.c
+++ b/drivers/staging/comedi/drivers/quatech_daqp_cs.c
@@ -642,7 +642,7 @@ static int daqp_ao_insn_write(struct comedi_device *dev,
 	/* Make sure D/A update mode is direct update */
 	outb(0, dev->iobase + DAQP_AUX_REG);
 
-	for (i = 0; i > insn->n; i++) {
+	for (i = 0; i < insn->n; i++) {
 		unsigned int val = data[i];
 		int ret;
 
