From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 08 Feb 2018 20:42:06 +0000
Subject: [PATCH 0/3] drm/amd/powerplay/hwmgr: Adjustments for eight function implementations
Message-Id: <1e5850db-c07f-add1-919a-be29be9c553d@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, Colin Ian King <colin.king@canonical.com>, David Airlie <airlied@linux.ie>, Eric Huang <JinHuiEric.Huang@amd.com>, Evan Quan <evan.quan@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>, Himanshu Jha <himanshujha199640@gmail.com>, Junwei Zhang <Jerry.Zhang@amd.com>, Rex Zhu <Rex.Zhu@amd.com>, Tom St Denis <tom.stdenis@amd.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 8 Feb 2018 21:37:42 +0100

Three update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Delete an error message for a failed memory allocation in three functions
  Adjust layout for source code from five if statements
  Delete an unnecessary return statement in three functions

 drivers/gpu/drm/amd/powerplay/hwmgr/cz_hwmgr.c     | 37 ++++++++++------------
 drivers/gpu/drm/amd/powerplay/hwmgr/hwmgr.c        | 35 +++++++++-----------
 drivers/gpu/drm/amd/powerplay/hwmgr/ppatomctrl.c   |  5 +--
 drivers/gpu/drm/amd/powerplay/hwmgr/rv_hwmgr.c     |  4 +--
 drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c |  1 -
 5 files changed, 35 insertions(+), 47 deletions(-)

-- 
2.16.1

