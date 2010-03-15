From: Dan Carpenter <error27@gmail.com>
Date: Mon, 15 Mar 2010 08:25:10 +0000
Subject: [patch] pcmcia: add important if statement
Message-Id: <20100315082510.GH18181@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: "James E.J. Bottomley" <James.Bottomley@suse.de>, Karsten Keil <keil@b1-systems.de>, Magnus Damm <damm@opensource.se>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, YOKOTA Hiroshi <yokota@netlab.is.tsukuba.ac.jp>

There was a problem introduced in Jul 2008 by:
0e6f9d270840 pcmcia: use pcmcia_loop_config in scsi pcmcia drivers

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/scsi/pcmcia/nsp_cs.c b/drivers/scsi/pcmcia/nsp_cs.c
index c2341af..0212464 100644
--- a/drivers/scsi/pcmcia/nsp_cs.c
+++ b/drivers/scsi/pcmcia/nsp_cs.c
@@ -1717,6 +1717,7 @@ static int nsp_cs_config(struct pcmcia_device *link)
 	cfg_mem->data = data;
 
 	ret = pcmcia_loop_config(link, nsp_cs_config_check, cfg_mem);
+	if (ret)
 		goto cs_failed;
 
 	if (link->conf.Attributes & CONF_ENABLE_IRQ) {
