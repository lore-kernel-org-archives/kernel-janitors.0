From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Tue, 15 Aug 2017 15:10:07 +0000
Subject: [PATCH 0/5] constify snd_soc_dai_ops structures
Message-Id: <1502809812-13891-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-rockchip@lists.infradead.org
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, adi-buildroot-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, bhumirks@gmail.com, linux-arm-kernel@lists.infradead.org

These snd_soc_dai_ops structures are only stored in the ops field of
a snd_soc_dai_driver structure, which is const.  Thus, the
snd_soc_dai_ops structures can be const too.

Done with the help of Coccinelle.

---

 sound/soc/blackfin/bf6xx-i2s.c    |    2 +-
 sound/soc/codecs/es8316.c         |    2 +-
 sound/soc/codecs/zx_aud96p22.c    |    2 +-
 sound/soc/rockchip/rockchip_pdm.c |    2 +-
 sound/soc/spear/spdif_in.c        |    2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)
