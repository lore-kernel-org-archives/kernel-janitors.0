From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 10 Sep 2012 03:51:08 +0000
Subject: [drm:drm-opt-power 45/80] drivers/gpu/drm/nouveau/nv50_dac.c:284 nv50_dac_destroy() warn: variable d
Message-Id: <20120910035108.GB30911@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Ben,

FYI, there are new smatch warnings show up in

tree:   git://people.freedesktop.org/~airlied/linux.git drm-opt-power
head:   5d8ff0b45eeb513c2ea807ae6fecf0460a89be9d
commit: 80eb8bb13b0d21d7834d2bab09337dc8ac38ab58 [45/80] drm/nouveau: port remainder of drm code, and rip out compat layer

All smatch warnings:

+ drivers/gpu/drm/nouveau/nv50_dac.c:284 nv50_dac_destroy() warn: variable dereferenced before check 'encoder' (see line 282)

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
