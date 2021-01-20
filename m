From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 20 Jan 2021 09:59:13 +0000
Subject: [PATCH] ASoC: topology: Fix memory corruption in soc_tplg_denum_create_values()
Message-Id: <YAf+8QZoOv+ct526@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>

The allocation uses sizeof(u32) when it should use sizeof(unsigned long)
so it leads to memory corruption later in the function when the data is
initialized.

Fixes: 5aebe7c7f9c2 ("ASoC: topology: fix endianness issues")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This is from static analysis, not from testing.  Obviously we don't
want memory corruption, so my patch is an improvement.  But I feel like
a better approach might be to change the type of dvalues[] to u32.  I
took the less risky approach because I'm not an expert and can't test
it.  But if someone else can take a look at it, then I'll redo the
patch.

 sound/soc/soc-topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 950c45008e24..37a5d73e643b 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -902,7 +902,7 @@ static int soc_tplg_denum_create_values(struct soc_tplg *tplg, struct soc_enum *
 		return -EINVAL;
 
 	se->dobj.control.dvalues = devm_kcalloc(tplg->dev, le32_to_cpu(ec->items),
-					   sizeof(u32),
+					   sizeof(*se->dobj.control.dvalues),
 					   GFP_KERNEL);
 	if (!se->dobj.control.dvalues)
 		return -ENOMEM;
-- 
2.29.2
