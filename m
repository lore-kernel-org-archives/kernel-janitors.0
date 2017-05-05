From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 05 May 2017 13:50:49 +0000
Subject: [PATCH 0/5] GPU-DRM-STI: Fine-tuning for some function implementations
Message-Id: <f4a1bd89-50c4-ea2d-ea70-de5209b8a55a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, Benjamin Gaignard <benjamin.gaignard@linaro.org>, David Airlie <airlied@linux.ie>, Fabien Dessenne <fabien.dessenne@st.com>, Vincent Abriou <vincent.abriou@st.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 5 May 2017 15:45:45 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (5):
  Reduce function calls for sequence output at five places
  Replace 17 seq_puts() calls by seq_putc()
  Fix a typo in a comment line
  Fix typos in a comment line
  Adjust two checks for null pointers in sti_hqvdp_probe()

 drivers/gpu/drm/sti/sti_cursor.c |  5 ++---
 drivers/gpu/drm/sti/sti_dvo.c    |  3 +--
 drivers/gpu/drm/sti/sti_gdp.c    |  3 +--
 drivers/gpu/drm/sti/sti_hda.c    |  9 +++------
 drivers/gpu/drm/sti/sti_hdmi.c   | 23 ++++++++++-------------
 drivers/gpu/drm/sti/sti_hqvdp.c  |  7 +++----
 drivers/gpu/drm/sti/sti_mixer.c  |  3 +--
 drivers/gpu/drm/sti/sti_tvout.c  |  7 +++----
 drivers/gpu/drm/sti/sti_vid.c    |  5 ++---
 9 files changed, 26 insertions(+), 39 deletions(-)

-- 
2.12.2

