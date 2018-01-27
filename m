From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 27 Jan 2018 12:40:28 +0000
Subject: [PATCH] ASoC: Intel: Fix some error handling path in 'sst_platform_get_resources()'
Message-Id: <20180127124028.3795-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, arvind.yadav.cs@gmail.com
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

Several error handling paths set 'ret' to an error code, but the function
always returns 0 (i.e. success)

Return 'ret' instead in order to return the error code.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
I guess that the code needs more correction. For this first try, I've left
the logic as-is, but I don't really see why we call 'pci_release_regions()'
in the normal path.
A 'return 0;' before the 'do_release_regions' label would sound more
logical to me.
---
 sound/soc/intel/atom/sst/sst_pci.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/atom/sst/sst_pci.c b/sound/soc/intel/atom/sst/sst_pci.c
index 6906ee624cf6..8cae20802b7c 100644
--- a/sound/soc/intel/atom/sst/sst_pci.c
+++ b/sound/soc/intel/atom/sst/sst_pci.c
@@ -105,9 +105,12 @@ static int sst_platform_get_resources(struct intel_sst_drv *ctx)
 		goto do_release_regions;
 	}
 	dev_dbg(ctx->dev, "DRAM Ptr %p\n", ctx->dram);
+
+	ret = 0;
+
 do_release_regions:
 	pci_release_regions(pci);
-	return 0;
+	return ret;
 }
 
 /*
-- 
2.14.1


---
L'absence de virus dans ce courrier électronique a été vérifiée par le logiciel antivirus Avast.
https://www.avast.com/antivirus

