From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Date: Thu, 08 Mar 2018 02:02:27 +0000
Subject: [PATCH 0/5] drm/vgem: Checkpatch cleanup for vgem
Message-Id: <cover.1520474055.git.rodrigosiqueiramelo@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org

This patchset fixes warnings and errors found by checkpatch.pl in the
drm/vgem:

* Removes assignment in if condition;
* Removes '(' from the end of line;
* Adds spaces around operators;
* Replaces uint32_t for u32;
* Indents switch and case at the same level.

Rodrigo Siqueira (5):
  drm/vgem: Indent switch and case at the same level
  drm/vgem: Remove assignment in if condition
  drm/vgem: Replace uint32_t for u32
  drm/vgem: Add space around operators
  drm/vgem: Remove '(' from the end of line

 drivers/gpu/drm/vgem/vgem_drv.c   | 21 +++++++++++++--------
 drivers/gpu/drm/vgem/vgem_fence.c | 11 +++++++----
 2 files changed, 20 insertions(+), 12 deletions(-)

-- 
2.16.2

