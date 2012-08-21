From: Emil Goode <emilgoode@gmail.com>
Date: Tue, 21 Aug 2012 14:51:59 +0000
Subject: [PATCH] ASoC: Remove unused variable
Message-Id: <1345560719-2704-1-git-send-email-emilgoode@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120821144923.GQ7995@opensource.wolfsonmicro.com>
In-Reply-To: <20120821144923.GQ7995@opensource.wolfsonmicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

This patch removes a unused struct snd_soc_dai.

Sparse is warning:
sound/soc/soc-compress.c:156:22: warning:
	unused variable ‘codec_dai’ [-Wunused-variable]

Signed-off-by: Emil Goode <emilgoode@gmail.com>
---
 sound/soc/soc-compress.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index 88d85ba..b837674 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -153,7 +153,6 @@ static int soc_compr_set_params(struct snd_compr_stream *cstream,
 {
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
 	struct snd_soc_platform *platform = rtd->platform;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
 	int ret = 0;
 
 	/* first we call set_params for the platform driver
-- 
1.7.10.4

