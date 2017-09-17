From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 17 Sep 2017 19:10:14 +0000
Subject: [PATCH] tty: synclink: Reuse an existing error handling path
Message-Id: <20170917191014.31577-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org, jslaby@suse.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

In order to avoid code duplication and to be more consistent with the
other error handling paths in this function, we should 'goto errout'.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/tty/synclink.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/tty/synclink.c b/drivers/tty/synclink.c
index 3be981101297..27db7818b673 100644
--- a/drivers/tty/synclink.c
+++ b/drivers/tty/synclink.c
@@ -4098,8 +4098,7 @@ static int mgsl_claim_resources(struct mgsl_struct *info)
 		if (request_dma(info->dma_level,info->device_name) < 0){
 			printk( "%s(%d):Can't request DMA channel on device %s DMA=%d\n",
 				__FILE__,__LINE__,info->device_name, info->dma_level );
-			mgsl_release_resources( info );
-			return -ENODEV;
+			goto errout;
 		}
 		info->dma_requested = true;
 
-- 
2.11.0

