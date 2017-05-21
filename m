From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 21 May 2017 08:23:52 +0000
Subject: [PATCH 0/3] zswap: Adjustments for three function implementations
Message-Id: <05101843-91f6-3243-18ea-acac8e8ef6af@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mm@kvack.org, Dan Streetman <ddstreet@ieee.org>, Seth Jennings <sjenning@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 21 May 2017 10:20:03 +0200

Three update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Delete an error message for a failed memory allocation in zswap_pool_create()
  Improve a size determination in zswap_frontswap_init()
  Delete an error message for a failed memory allocation in zswap_dstmem_prepare()

 mm/zswap.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

-- 
2.13.0

