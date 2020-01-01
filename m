From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Wed, 01 Jan 2020 17:49:42 +0000
Subject: [PATCH 02/10] ALSA: ml403-ac97cr: use resource_size
Message-Id: <1577900990-8588-3-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1577900990-8588-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1577900990-8588-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org

Use resource_size rather than a verbose computation on
the end and start fields.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

<smpl>
@@ struct resource *ptr; @@
- ((ptr->end) - (ptr->start) + 1)
+ resource_size(ptr)
</smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 sound/drivers/ml403-ac97cr.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/drivers/ml403-ac97cr.c b/sound/drivers/ml403-ac97cr.c
index 4e6042e652f0..9de5caaf6047 100644
--- a/sound/drivers/ml403-ac97cr.c
+++ b/sound/drivers/ml403-ac97cr.c
@@ -1100,9 +1100,7 @@ snd_ml403_ac97cr_create(struct snd_card *card, struct platform_device *pfdev,
 	PDEBUG(INIT_INFO, "Trying to reserve resources now ...\n");
 	resource = platform_get_resource(pfdev, IORESOURCE_MEM, 0);
 	/* get "port" */
-	ml403_ac97cr->port = ioremap(resource->start,
-					     (resource->end) -
-					     (resource->start) + 1);
+	ml403_ac97cr->port = ioremap(resource->start, resource_size(resource));
 	if (ml403_ac97cr->port = NULL) {
 		snd_printk(KERN_ERR SND_ML403_AC97CR_DRIVER ": "
 			   "unable to remap memory region (%pR)\n",
