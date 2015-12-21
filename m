From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 21 Dec 2015 19:05:39 +0000
Subject: [PATCH v2 0/4] staging-Lustre: Fine-tuning for some function implementations
Message-Id: <56784D83.7080108@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <566D7733.1030102@users.sourceforge.net>
In-Reply-To: <566D7733.1030102@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lustre-devel@lists.lustre.org, devel@driverdev.osuosl.org, Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Oleg Drokin <oleg.drokin@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 21 Dec 2015 20:00:02 +0100

Several update suggestions were taken into account
from static source code analysis.

Markus Elfring (4):
  Delete unnecessary goto statements in six functions
  Delete an unnecessary variable initialisation in mgc_process_recover_log()
  Less checks in mgc_process_recover_log() after error detection
  Fix a jump label position in osc_get_info()

 drivers/staging/lustre/lustre/llite/namei.c     |  1 -
 drivers/staging/lustre/lustre/mdc/mdc_request.c |  7 ----
 drivers/staging/lustre/lustre/mgc/mgc_request.c | 53 +++++++++++--------------
 drivers/staging/lustre/lustre/osc/osc_request.c |  2 +-
 4 files changed, 25 insertions(+), 38 deletions(-)

-- 
2.6.3

