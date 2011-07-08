From: Dan Carpenter <error27@gmail.com>
Date: Fri, 08 Jul 2011 07:25:40 +0000
Subject: [patch] Staging: tm6000: remove unneeded check in get_next_buf()
Message-Id: <20110708072540.GV18655@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@suse.de>
Cc: Mauro Carvalho Chehab <mchehab@redhat.com>, Stefan Ringel <stefan.ringel@arcor.de>, "Beholder Intl. Ltd. Dmitry Belimov" <d.belimov@gmail.com>, Hans Verkuil <hverkuil@xs4all.nl>, "open list:STAGING - TRIDENT..." <linux-media@vger.kernel.org>, "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>, kernel-janitors@vger.kernel.org

We dereference "buf" on the line before so if it were NULL here we
would have OOPsed earlier.  Also list_entry() never returns NULL.
And finally, we handled the situation where the list is empty
earlier in the function.

So this test isn't needed and I've removed it.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/staging/tm6000/tm6000-video.c b/drivers/staging/tm6000/tm6000-video.c
index 3fe6038..8d8b939 100644
--- a/drivers/staging/tm6000/tm6000-video.c
+++ b/drivers/staging/tm6000/tm6000-video.c
@@ -179,9 +179,6 @@ static inline void get_next_buf(struct tm6000_dmaqueue *dma_q,
 	*buf = list_entry(dma_q->active.next,
 			struct tm6000_buffer, vb.queue);
 
-	if (!buf)
-		return;
-
 	/* Cleans up buffer - Useful for testing for frame/URB loss */
 	outp = videobuf_to_vmalloc(&(*buf)->vb);
 
