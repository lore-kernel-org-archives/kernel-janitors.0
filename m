From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 18 Aug 2016 19:42:33 +0000
Subject: [PATCH 0/2] GPU-DRM-Savage: Fine-tuning for savage_bci_cmdbuf()
Message-Id: <77052ac1-1933-49af-3ad8-6e0eecc1aafe@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
In-Reply-To: <566ABCD9.1060404@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>
Cc: Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 18 Aug 2016 21:38:37 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Use memdup_user() rather than duplicating its implementation
  Less function calls after error detection

 drivers/gpu/drm/savage/savage_state.c | 42 +++++++++++++++--------------------
 1 file changed, 18 insertions(+), 24 deletions(-)

-- 
2.9.3

