From: Dan Carpenter <error27@gmail.com>
Date: Mon, 11 Oct 2010 03:54:17 +0000
Subject: [patch] ASoC: soc: snprintf() doesn't return negative
Message-Id: <20101011035416.GD5851@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lrg@slimlogic.co.uk>
Cc: alsa-devel@alsa-project.org, Jassi Brar <jassi.brar@samsung.com>, Takashi Iwai <tiwai@suse.de>, kernel-janitors@vger.kernel.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, Peter Ujfalusi <peter.ujfalusi@nokia.com>

In user space snprintf() returns negative on errors but the kernel
version only returns positives.  It could potentially return sizes
larger than the size of the buffer so we should check for that.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 8751efd..8da307b 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -284,8 +284,10 @@ static ssize_t codec_list_read_file(struct file *file, char __user *user_buf,
 		ret += snprintf(buf + ret, PAGE_SIZE - ret, "%s\n",
 				codec->name);
 
-	if (ret >= 0)
-		ret = simple_read_from_buffer(user_buf, count, ppos, buf, ret);
+	if (ret > PAGE_SIZE)
+		ret = PAGE_SIZE;
+
+	ret = simple_read_from_buffer(user_buf, count, ppos, buf, ret);
 
 	kfree(buf);
 
@@ -310,8 +312,10 @@ static ssize_t dai_list_read_file(struct file *file, char __user *user_buf,
 	list_for_each_entry(dai, &dai_list, list)
 		ret += snprintf(buf + ret, PAGE_SIZE - ret, "%s\n", dai->name);
 
-	if (ret >= 0)
-		ret = simple_read_from_buffer(user_buf, count, ppos, buf, ret);
+	if (ret > PAGE_SIZE)
+		ret = PAGE_SIZE;
+
+	ret = simple_read_from_buffer(user_buf, count, ppos, buf, ret);
 
 	kfree(buf);
 
@@ -338,8 +342,10 @@ static ssize_t platform_list_read_file(struct file *file,
 		ret += snprintf(buf + ret, PAGE_SIZE - ret, "%s\n",
 				platform->name);
 
-	if (ret >= 0)
-		ret = simple_read_from_buffer(user_buf, count, ppos, buf, ret);
+	if (ret > PAGE_SIZE)
+		ret = PAGE_SIZE;
+
+	ret = simple_read_from_buffer(user_buf, count, ppos, buf, ret);
 
 	kfree(buf);
 
