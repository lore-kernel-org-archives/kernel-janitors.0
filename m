From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 27 Sep 2012 06:10:57 +0000
Subject: [nouveau:master 86/96] drivers/gpu/drm/nouveau/core/subdev/therm/base.c:38:2: warning: enumeration
Message-Id: <20120927061057.GB26998@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Martin,

FYI, there are new compile warnings show up in

tree:   git://git.freedesktop.org/git/nouveau/linux-2.6 master
head:   301e77f5b7968ff10eac8f3938c30963d8fc0ac3
commit: c4f52f28c561f0243be6916e5777f4ff017ed82e [86/96] drm/nouveau/therm: move thermal-related functions to the therm subdev

All warnings:

drivers/gpu/drm/nouveau/core/subdev/therm/base.c: In function 'nouveau_therm_attr_get':
drivers/gpu/drm/nouveau/core/subdev/therm/base.c:38:2: warning: enumeration value 'NOUVEAU_THERM_ATTR_FAN_MODE' not handled in switch [-Wswitch]
drivers/gpu/drm/nouveau/core/subdev/therm/base.c: In function 'nouveau_therm_attr_set':
drivers/gpu/drm/nouveau/core/subdev/therm/base.c:70:2: warning: enumeration value 'NOUVEAU_THERM_ATTR_FAN_MODE' not handled in switch [-Wswitch]

vim +38 drivers/gpu/drm/nouveau/core/subdev/therm/base.c
c4f52f28 (Martin Peres 2012-09-02  22)  * Authors: Martin Peres
c4f52f28 (Martin Peres 2012-09-02  23)  */
c4f52f28 (Martin Peres 2012-09-02  24) 
c4f52f28 (Martin Peres 2012-09-02  25) #include <core/object.h>
c4f52f28 (Martin Peres 2012-09-02  26) #include <core/device.h>
c4f52f28 (Martin Peres 2012-09-02  27) 
c4f52f28 (Martin Peres 2012-09-02  28) #include <subdev/bios.h>
c4f52f28 (Martin Peres 2012-09-02  29) 
c4f52f28 (Martin Peres 2012-09-02  30) #include "priv.h"
c4f52f28 (Martin Peres 2012-09-02  31) 
c4f52f28 (Martin Peres 2012-09-02  32) int
c4f52f28 (Martin Peres 2012-09-02  33) nouveau_therm_attr_get(struct nouveau_therm *therm,
c4f52f28 (Martin Peres 2012-09-02  34) 		       enum nouveau_therm_attr_type type)
c4f52f28 (Martin Peres 2012-09-02  35) {
c4f52f28 (Martin Peres 2012-09-02  36) 	struct nouveau_therm_priv *priv = (void *)therm;
c4f52f28 (Martin Peres 2012-09-02  37) 
c4f52f28 (Martin Peres 2012-09-02 @38) 	switch (type) {
c4f52f28 (Martin Peres 2012-09-02  39) 	case NOUVEAU_THERM_ATTR_FAN_MIN_DUTY:
c4f52f28 (Martin Peres 2012-09-02  40) 		return priv->bios_fan.min_duty;
c4f52f28 (Martin Peres 2012-09-02  41) 	case NOUVEAU_THERM_ATTR_FAN_MAX_DUTY:
c4f52f28 (Martin Peres 2012-09-02  42) 		return priv->bios_fan.max_duty;
c4f52f28 (Martin Peres 2012-09-02  43) 	case NOUVEAU_THERM_ATTR_THRS_FAN_BOOST:
c4f52f28 (Martin Peres 2012-09-02  44) 		return priv->bios_sensor.thrs_fan_boost.temp;
c4f52f28 (Martin Peres 2012-09-02  45) 	case NOUVEAU_THERM_ATTR_THRS_FAN_BOOST_HYST:
c4f52f28 (Martin Peres 2012-09-02  46) 		return priv->bios_sensor.thrs_fan_boost.hysteresis;

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
