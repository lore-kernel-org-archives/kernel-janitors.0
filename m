From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 27 Sep 2012 17:53:18 +0000
Subject: [nouveau:master 86/96] drivers/gpu/drm/nouveau/core/subdev/therm/fan.c:134:29: sparse: constant
Message-Id: <20120927175318.GE5517@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120927061057.GB26998@localhost>
In-Reply-To: <20120927061057.GB26998@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Martin,

FYI, there are new sparse warnings show up in

tree:   git://git.freedesktop.org/git/nouveau/linux-2.6 master
head:   301e77f5b7968ff10eac8f3938c30963d8fc0ac3
commit: 7303dcd8a45f9616c3d1e6f46f5f14639a6696f1 [86/96] drm/nouveau/fan: rewrite the fan tachometer driver to get more precision, faster

+ drivers/gpu/drm/nouveau/core/subdev/therm/fan.c:134:29: sparse: constant 60000000000 is so big it is long long
? drivers/gpu/drm/nouveau/core/subdev/therm/nv40.c:163:2: sparse: no newline at end of file
? drivers/gpu/drm/nouveau/core/subdev/therm/nv40.c:79:1: sparse: symbol 'nv40_fan_pwm_get' was not declared. Should it be static?
? drivers/gpu/drm/nouveau/core/subdev/therm/nv40.c:105:1: sparse: symbol 'nv40_fan_pwm_set' was not declared. Should it be static?
? drivers/gpu/drm/nouveau/core/subdev/therm/nv50.c:54:1: sparse: symbol 'nv50_fan_pwm_get' was not declared. Should it be static?
? drivers/gpu/drm/nouveau/core/subdev/therm/nv50.c:70:1: sparse: symbol 'nv50_fan_pwm_set' was not declared. Should it be static?
? drivers/gpu/drm/nouveau/core/subdev/therm/nv50.c:83:1: sparse: symbol 'nv50_temp_get' was not declared. Should it be static?

vim +134 drivers/gpu/drm/nouveau/core/subdev/therm/fan.c

7303dcd8 (Martin Peres 2012-09-02  133) 	if (cycles = 5) {
7303dcd8 (Martin Peres 2012-09-02 @134) 		tach = (u64)60000000000;
7303dcd8 (Martin Peres 2012-09-02  135) 		do_div(tach, (end - start));
7303dcd8 (Martin Peres 2012-09-02  136) 		return tach;
7303dcd8 (Martin Peres 2012-09-02  137) 	} else
7303dcd8 (Martin Peres 2012-09-02  138) 		return 0;
c4f52f28 (Martin Peres 2012-09-02  139) }

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
