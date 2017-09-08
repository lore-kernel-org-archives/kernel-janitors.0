From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 08 Sep 2017 20:50:13 +0000
Subject: [PATCH 0/3] S5P MFC: Adjustments for five function implementations
Message-Id: <482a6c92-a85e-0bcd-edf7-3c2f63ea74c5@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 8 Sep 2017 22:44:55 +0200

Three update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Delete an error message for a failed memory allocation in s5p_mfc_probe()
  Improve a size determination ins5p_mfc_alloc_memdev()
  Adjust a null pointer check in four functions

 drivers/media/platform/s5p-mfc/s5p_mfc.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

-- 
2.14.1

