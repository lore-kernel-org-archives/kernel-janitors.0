From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 14 Aug 2017 11:14:21 +0000
Subject: [PATCH 0/2] zpool: Adjustments for zpool_create_pool()
Message-Id: <0fec59a9-ac68-33f6-533a-adfb5fa3c380@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mm@kvack.org, Dan Streetman <ddstreet@ieee.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 14 Aug 2017 13:12:34 +0200

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete an error message for a failed memory allocation
  Use common error handling code

 mm/zpool.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

-- 
2.14.0

