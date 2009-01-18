From: Hannes Eder <hannes@hanneseder.net>
Date: Sun, 18 Jan 2009 15:28:31 +0000
Subject: [PATCH 0/3] drivers/gpu/drm: fix (sparse) warnings
Message-Id: <20090118152725.4179.40835.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.sourceforge.net
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

The following series fixes a couple of (sparse) warnings.

---

Hannes Eder (3):
      drivers/gpu/drm: comment out dead code
      drivers/gpu/drm: fix sparse warnings: unexport symbols
      drivers/gpu/drm: fix sparse warnings: make symbols static


 drivers/gpu/drm/drm_crtc.c        |   17 ++++++++++-------
 drivers/gpu/drm/drm_crtc_helper.c |    6 +++---
 drivers/gpu/drm/drm_edid.c        |    4 ++--
 drivers/gpu/drm/drm_modes.c       |   13 +++++++------
 4 files changed, 22 insertions(+), 18 deletions(-)
