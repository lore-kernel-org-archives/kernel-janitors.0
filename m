From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 03 Aug 2012 13:18:41 +0000
Subject: [sound:for-linus 16/16] sound/soc/soc-core.c:4139:3-8: WARNING: invalid free of devm_ allocated data
Message-Id: <20120803131841.GB20007@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Mark,

There are coccinelle warnings in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-linus
head:   ac190c76680cde6ce379b6be5baf89a970ea13d4
commit: ac190c76680cde6ce379b6be5baf89a970ea13d4 [16/16] Merge tag 'asoc-3.6' of git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound into for-linus

All coccinelle warnings:

+ sound/soc/soc-core.c:4139:3-8: WARNING: invalid free of devm_ allocated data
  sound/soc/soc-core.c:4148:3-8: WARNING: invalid free of devm_ allocated data

vim +4139 sound/soc/soc-core.c
  4136				dev_err(card->dev,
  4137					"Property '%s' index %d could not be read: %d\n",
  4138					propname, 2 * i, ret);
> 4139				kfree(routes);
  4140				return -EINVAL;
  4141			}
  4142			ret = of_property_read_string_index(np, propname,

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
