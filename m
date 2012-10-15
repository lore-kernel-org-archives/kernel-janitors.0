From: Yuanhan Liu <yuanhan.liu@intel.com>
Date: Mon, 15 Oct 2012 07:21:05 +0000
Subject: [asoc:topic/wm2200] sound/soc/codecs/wm2200.c:1033:4: warning: format '%d' expects argument of type
Message-Id: <20121015072105.GC2136@yliu-dev.sh.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Yuanhan Liu <yuanhan.liu@intel.com>, kernel-janitors@vger.kernel.org, wfg@linux.intel.com, alsa-devel@alsa-project.org

Hi Mark,

FYI, there are new compile warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git topic/wm2200
head:   9874482985fb26f90c3b2d8f1a82bd796d141304
commit: 6e87badd3f38e1a095d6e1b13828246c3e8486b5 ASoC: wm2200: Provide initial coefficient loading
config: x86_64-allmodconfig # make ARCH=x86_64 allmodconfig

All warnings:

sound/soc/codecs/wm2200.c: In function 'wm2200_dsp_load':
sound/soc/codecs/wm2200.c:1033:4: warning: format '%d' expects argument of type 'int', but argument 4 has type 'size_t' [-Wformat]
sound/soc/codecs/wm2200.c:1145:5: warning: format '%d' expects argument of type 'int', but argument 5 has type 'long unsigned int' [-Wformat]
sound/soc/codecs/wm2200.c: In function 'wm2200_setup_algs':
sound/soc/codecs/wm2200.c:1187:2: warning: format '%d' expects argument of type 'int', but argument 7 has type 'size_t' [-Wformat]
sound/soc/codecs/wm2200.c:1207:5: warning: format '%x' expects argument of type 'unsigned int', but argument 3 has type 'long unsigned int' [-Wformat]
sound/soc/codecs/wm2200.c: In function 'wm2200_load_coeff':
sound/soc/codecs/wm2200.c:1270:4: warning: format '%d' expects argument of type 'int', but argument 4 has type 'size_t' [-Wformat]
sound/soc/codecs/wm2200.c:1334:5: warning: format '%d' expects argument of type 'int', but argument 5 has type 'long unsigned int' [-Wformat]

vim +1033 sound/soc/codecs/wm2200.c

e10f8711 Mark Brown 2012-10-04  1017  		break;
e10f8711 Mark Brown 2012-10-04  1018  	default:
e10f8711 Mark Brown 2012-10-04  1019  		dev_err(codec->dev, "BASE %x\n", base);
e10f8711 Mark Brown 2012-10-04  1020  		BUG_ON(1);
e10f8711 Mark Brown 2012-10-04  1021  		return -EINVAL;
e10f8711 Mark Brown 2012-10-04  1022  	}
e10f8711 Mark Brown 2012-10-04  1023  
e10f8711 Mark Brown 2012-10-04  1024  	ret = request_firmware(&firmware, file, codec->dev);
e10f8711 Mark Brown 2012-10-04  1025  	if (ret != 0) {
e10f8711 Mark Brown 2012-10-04  1026  		dev_err(codec->dev, "Failed to request '%s'\n", file);
e10f8711 Mark Brown 2012-10-04  1027  		return ret;
e10f8711 Mark Brown 2012-10-04  1028  	}
e10f8711 Mark Brown 2012-10-04  1029  
e10f8711 Mark Brown 2012-10-04  1030  	pos = sizeof(*header) + sizeof(*adsp1_sizes) + sizeof(*footer);
e10f8711 Mark Brown 2012-10-04  1031  	if (pos >= firmware->size) {
e10f8711 Mark Brown 2012-10-04  1032  		dev_err(codec->dev, "%s: file too short, %d bytes\n",
e10f8711 Mark Brown 2012-10-04 @1033  			file, firmware->size);
e10f8711 Mark Brown 2012-10-04  1034  		return -EINVAL;
e10f8711 Mark Brown 2012-10-04  1035  	}
e10f8711 Mark Brown 2012-10-04  1036  
e10f8711 Mark Brown 2012-10-04  1037  	header = (void*)&firmware->data[0];
e10f8711 Mark Brown 2012-10-04  1038  
e10f8711 Mark Brown 2012-10-04  1039  	if (memcmp(&header->magic[0], "WMFW", 4) != 0) {
e10f8711 Mark Brown 2012-10-04  1040  		dev_err(codec->dev, "%s: invalid magic\n", file);
e10f8711 Mark Brown 2012-10-04  1041  		return -EINVAL;

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
