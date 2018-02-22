From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Date: Thu, 22 Feb 2018 23:59:33 +0000
Subject: [PATCH 0/7] drm/virtio: Checkpatch cleanup for virtio
Message-Id: <cover.1519343668.git.rodrigosiqueiramelo@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org

This patchset fixes warnings and errors found by checkpatch.pl in the
drm/virtio:

* Removes return from void function;
* Adds */ in block comments to separate line;
* Adds blank line after variable declarations;
* Adds tabs at the start of a line;
* Replaces 'unsigned' for 'unsigned int';
* Removes multiple blank lines;
* Adds spaces around operators.

Rodrigo Siqueira (7):
  drm/virtio: Add tabs at the start of a line
  drm/virtio: Add blank line after variable declarations
  drm/virtio: Add */ in block comments to separate line
  drm/virtio: Remove return from void function
  drm/virtio: Replace 'unsigned' for 'unsigned int'
  drm/virtio: Remove multiple blank lines
  drm/virtio: Add spaces around operators

 drivers/gpu/drm/virtio/virtgpu_display.c |  7 ++++---
 drivers/gpu/drm/virtio/virtgpu_drv.c     |  2 +-
 drivers/gpu/drm/virtio/virtgpu_drv.h     |  8 ++++----
 drivers/gpu/drm/virtio/virtgpu_fb.c      |  6 +++++-
 drivers/gpu/drm/virtio/virtgpu_gem.c     |  1 +
 drivers/gpu/drm/virtio/virtgpu_ioctl.c   | 23 +++++++++++++----------
 drivers/gpu/drm/virtio/virtgpu_prime.c   |  4 ++--
 drivers/gpu/drm/virtio/virtgpu_ttm.c     |  4 +---
 drivers/gpu/drm/virtio/virtgpu_vq.c      | 13 ++++++++-----
 9 files changed, 39 insertions(+), 29 deletions(-)

-- 
2.16.2

