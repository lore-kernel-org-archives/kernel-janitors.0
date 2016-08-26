From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 26 Aug 2016 12:43:48 +0000
Subject: [PATCH 0/8] cris-cryptocop: Fine-tuning for some function implementations
Message-Id: <bfc23090-e05d-f491-2a28-1803ceb31a31@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
In-Reply-To: <566ABCD9.1060404@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-cris-kernel@axis.com, Adam Buchbinder <adam.buchbinder@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>, Jiri Kosina <jkosina@suse.cz>, Mikael Starvik <starvik@axis.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Paolo Bonzini <pbonzini@redhat.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 26 Aug 2016 14:34:34 +0200

Several update suggestions were taken into account
from static source code analysis.

Markus Elfring (8):
  Use kmalloc_array() in two functions
  Improve determination of sizes in five functions
  Delete unnecessary braces
  Less function calls after error detection
  Move an assignment for the variable "nooutpages"
  Delete two variables
  Delete unnecessary variable initialisations
  Apply another recommendation from "checkpatch.pl"

 arch/cris/arch-v32/drivers/cryptocop.c | 299 +++++++++++++++------------------
 1 file changed, 140 insertions(+), 159 deletions(-)

-- 
2.9.3

