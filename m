From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 11 May 2017 13:45:13 +0000
Subject: [PATCH 0/4] C64x+ Megamodule PIC: Adjustments for three functions
Message-Id: <1b8c2efb-1096-3b78-9100-e20c55b6ecf1@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c6x-dev@linux-c6x.org, Aurelien Jacquiot <a-jacquiot@ti.com>, Mark Salter <msalter@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 11 May 2017 15:20:35 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (4):
  Improve a size determination in init_megamod_pic()
  Delete an error message for a failed memory allocation in init_megamod_pic()
  Delete an unnecessary return statement in megamod_pic_init()
  Fix a typo in a comment line

 arch/c6x/platforms/megamod-pic.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

-- 
2.12.3

