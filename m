From: Colin King <colin.king@canonical.com>
Date: Mon, 02 Jul 2018 08:31:45 +0000
Subject: [PATCH] char: pcmcia: remove redundant pointer dev
Message-Id: <20180702083145.14326-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Harald Welte <laforge@gnumonks.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer dev is being assigned but is never used hence it is redundant
and can be removed.

Cleans up clang warning:
warning: variable ‘dev’ set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/char/pcmcia/cm4000_cs.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/char/pcmcia/cm4000_cs.c b/drivers/char/pcmcia/cm4000_cs.c
index 370e0a64ead1..a219964cb770 100644
--- a/drivers/char/pcmcia/cm4000_cs.c
+++ b/drivers/char/pcmcia/cm4000_cs.c
@@ -1748,8 +1748,6 @@ static int cm4000_config_check(struct pcmcia_device *p_dev, void *priv_data)
 
 static int cm4000_config(struct pcmcia_device * link, int devno)
 {
-	struct cm4000_dev *dev;
-
 	link->config_flags |= CONF_AUTO_SET_IO;
 
 	/* read the config-tuples */
@@ -1759,8 +1757,6 @@ static int cm4000_config(struct pcmcia_device * link, int devno)
 	if (pcmcia_enable_device(link))
 		goto cs_release;
 
-	dev = link->priv;
-
 	return 0;
 
 cs_release:
-- 
2.17.1

