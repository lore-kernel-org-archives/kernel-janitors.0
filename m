From: green@linuxhacker.ru
Date: Sun, 26 Apr 2015 05:14:27 +0000
Subject: [PATCH 0/2] Fix a couple of dri drivers memory leaks
Message-Id: <1430025269-26243-1-git-send-email-green@linuxhacker.ru>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Cc: open list <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Oleg Drokin <green@linuxhacker.ru>

From: Oleg Drokin <green@linuxhacker.ru>

A couple of memory leaks found by smatch.

Oleg Drokin (2):
  drm/qlx: Fix a memory leak on error path
  drm: fix a memleak on mutex failure path

 drivers/gpu/drm/drm_modeset_lock.c | 4 +++-
 drivers/gpu/drm/qxl/qxl_fb.c       | 7 +++++--
 2 files changed, 8 insertions(+), 3 deletions(-)

-- 
2.1.0

