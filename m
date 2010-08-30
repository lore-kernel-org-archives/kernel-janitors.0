From: Dan Carpenter <error27@gmail.com>
Date: Mon, 30 Aug 2010 08:14:45 +0000
Subject: [patch] pcmcia: comedi: fix compile error
Message-Id: <20100830081231.GL9832@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@suse.de>
Cc: Dominik Brodowski <linux@dominikbrodowski.net>, Marcel Holtmann <marcel@holtmann.org>, Alexander Kurz <linux@kbdbabel.org>, Andrea Gelmini <andrea.gelmini@gelma.net>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We changed struct pcmcia_device in 90abdc3b973229 "pcmcia: do not use
io_req_t when calling pcmcia_request_io()".  The rest of this file got
updated to the new API but this line was missed so my config doesn't
compile.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/staging/comedi/drivers/das08_cs.c b/drivers/staging/comedi/drivers/das08_cs.c
index c6aa52f..729ba8f 100644
--- a/drivers/staging/comedi/drivers/das08_cs.c
+++ b/drivers/staging/comedi/drivers/das08_cs.c
@@ -222,7 +222,7 @@ static int das08_pcmcia_config_loop(struct pcmcia_device *p_dev,
 		p_dev->resource[0]->flags &= ~IO_DATA_PATH_WIDTH;
 		p_dev->resource[0]->flags | 			pcmcia_io_cfg_data_width(io->flags);
-		p_dev->io.IOAddrLines = io->flags & CISTPL_IO_LINES_MASK;
+		p_dev->io_lines = io->flags & CISTPL_IO_LINES_MASK;
 		p_dev->resource[0]->start = io->win[0].base;
 		p_dev->resource[0]->end = io->win[0].len;
 		if (io->nwin > 1) {
