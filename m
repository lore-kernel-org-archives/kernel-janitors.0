From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 30 May 2018 10:36:55 +0000
Subject: [PATCH] ALSA: xen-front: freeing an error pointer
Message-Id: <20180530103655.bnjzq2jpfrjjwvvj@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Cc: xen-devel@lists.xenproject.org, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>

kfree() doesn't accept error pointers so I've set "str" to NULL on these
paths.

Fixes: fd3b36045c2c ("ALSA: xen-front: Read sound driver configuration from Xen store")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/xen/xen_snd_front_cfg.c b/sound/xen/xen_snd_front_cfg.c
index 38c7e1eefbb9..68dcd7d1f09e 100644
--- a/sound/xen/xen_snd_front_cfg.c
+++ b/sound/xen/xen_snd_front_cfg.c
@@ -306,6 +306,7 @@ static int cfg_get_stream_type(const char *path, int index,
 	str = xenbus_read(XBT_NIL, stream_path, XENSND_FIELD_TYPE, NULL);
 	if (IS_ERR(str)) {
 		ret = PTR_ERR(str);
+		str = NULL;
 		goto fail;
 	}
 
@@ -347,6 +348,7 @@ static int cfg_stream(struct xen_snd_front_info *front_info,
 	str = xenbus_read(XBT_NIL, stream_path, XENSND_FIELD_TYPE, NULL);
 	if (IS_ERR(str)) {
 		ret = PTR_ERR(str);
+		str = NULL;
 		goto fail;
 	}
 
