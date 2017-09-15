From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 15 Sep 2017 16:00:07 +0000
Subject: [PATCH 0/2] [media] C8SECTPFE: Adjustments for c8sectpfe_frontend_attach()
Message-Id: <3e5fcfbe-828a-8c15-12d4-c74e8a1f20f1@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 15 Sep 2017 17:55:43 +0200

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete an error message for a failed memory allocation
  Improve two size determinations

 drivers/media/platform/sti/c8sectpfe/c8sectpfe-dvb.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

-- 
2.14.1

