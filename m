From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 18 Sep 2016 16:48:07 +0000
Subject: [PATCH 0/5] drm/amdgpu: Fine-tuning for several function implementations
Message-Id: <8d614254-1cba-0379-cf84-52ad9bd9f3a7@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
In-Reply-To: <566ABCD9.1060404@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, Chunming Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>, Monk Liu <Monk.Liu@amd.com>, Tom St Denis <tom.stdenis@amd.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 18 Sep 2016 18:38:48 +0200

Some update suggestions were taken into account
from static source code analysis.

Markus Elfring (5):
  Use kmalloc_array() in amdgpu_debugfs_gca_config_read()
  Improve determination of sizes in two functions
  Rename a jump label in amdgpu_debugfs_regs_read()
  Rename a jump label in amdgpu_device_init()
  Adjust checks for null pointers in nine functions

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 68 +++++++++++++++---------------
 1 file changed, 33 insertions(+), 35 deletions(-)

-- 
2.10.0

