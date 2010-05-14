From: Dan Carpenter <error27@gmail.com>
Date: Fri, 14 May 2010 14:49:20 +0000
Subject: [patch -next] asihpi: testing the wrong variable
Message-Id: <20100514144920.GC17487@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.de>, Eliot Blennerhassett <eblennerhassett@audioscience.com>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

There is a typo here.  We want to test "*dst" not "dst".

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/sound/pci/asihpi/hpifunc.c b/sound/pci/asihpi/hpifunc.c
index 254c580..15f0c7e 100644
--- a/sound/pci/asihpi/hpifunc.c
+++ b/sound/pci/asihpi/hpifunc.c
@@ -3279,7 +3279,7 @@ static u16 hpi_entity_alloc_and_copy(struct hpi_entity *src,
 
 	buf_size = hpi_entity_size(src);
 	*dst = kmalloc(buf_size, GFP_KERNEL);
-	if (dst = NULL)
+	if (*dst = NULL)
 		return HPI_ERROR_MEMORY_ALLOC;
 	memcpy(*dst, src, buf_size);
 	return 0;
