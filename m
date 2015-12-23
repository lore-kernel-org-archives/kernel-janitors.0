From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 23 Dec 2015 18:02:46 +0000
Subject: [PATCH 0/5] block-LDM: Improvements for exception handling
Message-Id: <567AE1C6.9020108@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <567A6CDB.4030703@users.sourceforge.net>
 <alpine.DEB.2.10.1512231140090.4367@hadrien>
In-Reply-To: <alpine.DEB.2.10.1512231140090.4367@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ntfs-dev@lists.sourceforge.net, linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, Richard Russon <ldm@flatcap.org>
Cc: Julia Lawall <julia.lawall@lip6.fr>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 23 Dec 2015 17:32:12 +0100

Several update suggestions were taken into account
from static source code analysis.

Markus Elfring (5):
  One function call less in ldm_validate_tocblocks() after error detection
  Delete extra log messages for memory allocation failures
  One function call less in ldm_partition() after error detection
  Less function calls in ldm_validate_privheads() after error detection
  Fine-tuning for the source code formatting

 block/partitions/ldm.c | 455 +++++++++++++++++++++++++------------------------
 1 file changed, 236 insertions(+), 219 deletions(-)

-- 
2.6.3

