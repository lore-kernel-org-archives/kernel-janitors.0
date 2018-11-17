From: Mark Brown <broonie@kernel.org>
Date: Sat, 17 Nov 2018 03:27:46 +0000
Subject: Applied "ASoC: amd: fix spelling mistake "Inavlid" -> "Invalid"" to the asoc tree
Message-Id: <20181117032746.B63D0440078@finisterre.ee.mobilebroadband>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181116133943.8267-1-colin.king@canonical.com>
In-Reply-To: <20181116133943.8267-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin Ian King <colin.king@canonical.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>

The patch

   ASoC: amd: fix spelling mistake "Inavlid" -> "Invalid"

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 00347e4ea8ca4c6ed5e254d7cebad0917175a07e Mon Sep 17 00:00:00 2001
From: Colin Ian King <colin.king@canonical.com>
Date: Fri, 16 Nov 2018 13:39:43 +0000
Subject: [PATCH] ASoC: amd: fix spelling mistake "Inavlid" -> "Invalid"

There is a spelling mistake in a dev_err message. Fix this.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/amd/raven/pci-acp3x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/raven/pci-acp3x.c b/sound/soc/amd/raven/pci-acp3x.c
index ef805e71a98f..c28457fd9b81 100644
--- a/sound/soc/amd/raven/pci-acp3x.c
+++ b/sound/soc/amd/raven/pci-acp3x.c
@@ -105,7 +105,7 @@ static int snd_acp3x_probe(struct pci_dev *pci,
 		}
 		break;
 	default:
-		dev_err(&pci->dev, "Inavlid ACP audio mode : %d\n", val);
+		dev_err(&pci->dev, "Invalid ACP audio mode : %d\n", val);
 		ret = -ENODEV;
 		goto unmap_mmio;
 	}
-- 
2.19.1
