From: Hannes Eder <hannes@hanneseder.net>
Date: Thu, 18 Dec 2008 22:27:36 +0000
Subject: [PATCH 0/6] drm/i915: fix sparse warnings
Message-Id: <494ad5ce.06e2660a.73b0.ffffd586@mx.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.sourceforge.net

This series of patches fixes a couple of sparse warnings in drm/i915.

Hannes Eder (6):
  drm/i915: fix sparse warnings: declare one-bit bitfield as unsigned
  drm/i915: fix sparse warnings: make symbols static
  drm/i915: fix sparse warnings: move 'extern' decls to header file
  drm/i915: fix sparse warnings: returning void-valued expression
  drm/i915: comment out unused function 'i915_driver_firstopen'
  drm/i915: add prototype for 'intelfb_panic' to header file

 drivers/gpu/drm/i915/dvo.h           |    6 ++++++
 drivers/gpu/drm/i915/i915_dma.c      |    8 +++++---
 drivers/gpu/drm/i915/i915_drv.c      |    2 +-
 drivers/gpu/drm/i915/i915_drv.h      |    8 ++++----
 drivers/gpu/drm/i915/i915_opregion.c |    4 ++--
 drivers/gpu/drm/i915/intel_crt.c     |    2 +-
 drivers/gpu/drm/i915/intel_display.c |   10 +++++-----
 drivers/gpu/drm/i915/intel_drv.h     |    2 ++
 drivers/gpu/drm/i915/intel_dvo.c     |   10 ++--------
 drivers/gpu/drm/i915/intel_fb.c      |   10 +++++-----
 drivers/gpu/drm/i915/intel_sdvo.c    |    9 +++++----
 drivers/gpu/drm/i915/intel_tv.c      |    2 +-
 12 files changed, 39 insertions(+), 34 deletions(-)

