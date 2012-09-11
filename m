From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 11 Sep 2012 03:00:03 +0000
Subject: [asoc:for-next 110/115] sound/soc/soc-core.c:901 soc_bind_dai_link() error: we previously assumed 'd
Message-Id: <20120911030003.GB23365@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Timur Tabi <timur@freescale.com>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, kernel-janitors@vger.kernel.org

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
head:   bffb28a4233d25d37a444785f766e98a041b4413
commit: a6179d2741640a1ec88a1c5b9c2c28bdf45666db [110/115] ASoC: core: display the platform node name if there is no platform name

All smatch warnings:

+ sound/soc/soc-core.c:901 soc_bind_dai_link() error: we previously assumed 'dai_link->platform_of_node' could be null (see line 887)

vim +901 sound/soc/soc-core.c
   884
   885         /* find one from the set of registered platforms */
   886         list_for_each_entry(platform, &platform_list, list) {
 > 887                 if (dai_link->platform_of_node) {
   888                         if (platform->dev->of_node !   889                             dai_link->platform_of_node)
   890                                 continue;
   891			} else {
   892				if (strcmp(platform->name, platform_name))
   893					continue;
   894			}
   895	
   896			rtd->platform = platform;
   897		}
   898		if (!rtd->platform) {
   899			dev_err(card->dev, "platform %s not registered\n",
   900				dai_link->platform_name ? :
 > 901					dai_link->platform_of_node->full_name);
   902			return -EPROBE_DEFER;
   903		}
   904	
   905		card->num_rtd++;
   906	
   907		return 0;
   908	}

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
