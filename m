From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 15 May 2017 14:00:33 +0000
Subject: [PATCH 0/2] PCMCIA-Resource management: Adjustments for three function implementations
Message-Id: <0d48eee5-11d8-e44e-8c11-6370ae7a7ea1@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-pcmcia@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 15 May 2017 15:46:54 +0200

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Improve a size determination in three functions
  Delete an error message for a failed memory allocation in two functions

 drivers/pcmcia/rsrc_nonstatic.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

-- 
2.13.0

