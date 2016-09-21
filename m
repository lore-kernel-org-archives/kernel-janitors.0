From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 21 Sep 2016 07:23:05 +0000
Subject: [PATCH 0/5] GPU-DRM-nouveau: Fine-tuning for five function implementations
Message-Id: <5bcff2ec-f3bd-ab9c-e13d-3a4f5cf7c73b@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Martin Peres <martin.peres@free.fr>, Roy Spliet <rspliet@eclipso.eu>
Cc: trivial@kernel.org, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 21 Sep 2016 09:09:09 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (5):
  Use kmalloc_array() in nvbios_iccsense_parse()
  Use kmalloc_array() in gt215_link_train()
  Delete unnecessary braces
  Adjust a kzalloc() call in gt215_ram_new()
  Add space after an "if"

 drivers/gpu/drm/nouveau/nvkm/subdev/bios/iccsense.c |  4 +++-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c   | 21 +++++++++------------
 2 files changed, 12 insertions(+), 13 deletions(-)

-- 
2.10.0

