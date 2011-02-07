From: Dan Carpenter <error27@gmail.com>
Date: Mon, 07 Feb 2011 19:01:41 +0000
Subject: [patch] ALSA: soc-cache: dereferencing before checking
Message-Id: <20110207190141.GJ4384@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lrg@slimlogic.co.uk>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, kernel-janitors@vger.kernel.org

The patch c358e640a66 "ASoC: soc-cache: Add trace event for
snd_soc_cache_sync()" introduced a dereference of "codec->cache_ops"
before we had checked it for NULL.

I pulled the check forward, and then pulled everything in an indent
level.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/sound/soc/soc-cache.c b/sound/soc/soc-cache.c
index db66dc4..5d76da4 100644
--- a/sound/soc/soc-cache.c
+++ b/sound/soc/soc-cache.c
@@ -1609,24 +1609,23 @@ int snd_soc_cache_sync(struct snd_soc_codec *codec)
 		return 0;
 	}
 
+	if (!codec->cache_ops || !codec->cache_ops->sync)
+		return -EINVAL;
+
 	if (codec->cache_ops->name)
 		name = codec->cache_ops->name;
 	else
 		name = "unknown";
 
-	if (codec->cache_ops && codec->cache_ops->sync) {
-		if (codec->cache_ops->name)
-			dev_dbg(codec->dev, "Syncing %s cache for %s codec\n",
-				codec->cache_ops->name, codec->name);
-		trace_snd_soc_cache_sync(codec, name, "start");
-		ret = codec->cache_ops->sync(codec);
-		if (!ret)
-			codec->cache_sync = 0;
-		trace_snd_soc_cache_sync(codec, name, "end");
-		return ret;
-	}
-
-	return -EINVAL;
+	if (codec->cache_ops->name)
+		dev_dbg(codec->dev, "Syncing %s cache for %s codec\n",
+			codec->cache_ops->name, codec->name);
+	trace_snd_soc_cache_sync(codec, name, "start");
+	ret = codec->cache_ops->sync(codec);
+	if (!ret)
+		codec->cache_sync = 0;
+	trace_snd_soc_cache_sync(codec, name, "end");
+	return ret;
 }
 EXPORT_SYMBOL_GPL(snd_soc_cache_sync);
 
