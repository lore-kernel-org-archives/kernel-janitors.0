From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 03 Aug 2017 19:11:15 +0000
Subject: [PATCH 0/4] axonram: Adjustments for axon_ram_probe()
Message-Id: <009fdef0-b2c9-5e98-d32d-14149aec92c5@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linuxppc-dev@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jan Kara <jack@suse.cz>, Jens Axboe <axboe@fb.com>, Dan Williams <dan.j.williams@intel.com>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 3 Aug 2017 21:02:02 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (4):
  Delete an error message for a failed memory allocation
  Improve a size determination in axon_ram_probe()
  Return directly after a failed kzalloc()
  Delete an unnecessary variable initialisation

 arch/powerpc/sysdev/axonram.c | 43 ++++++++++++++++++-------------------------
 1 file changed, 18 insertions(+), 25 deletions(-)

-- 
2.13.4

