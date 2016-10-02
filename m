From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 02 Oct 2016 11:54:43 +0000
Subject: [PATCH 00/13] md/multipath: Fine-tuning for several function implementations
Message-Id: <4a31d7a7-f70c-12f7-202f-963bd8706066@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
In-Reply-To: <566ABCD9.1060404@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-raid@vger.kernel.org, Jens Axboe <axboe@fb.com>, NeilBrown <neilb@suse.com>, Shaohua Li <shli@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 2 Oct 2016 13:45:35 +0200

Several update suggestions were taken into account
from static source code analysis.

Markus Elfring (13):
  Use kcalloc() in multipath_run()
  Improve another size determination in multipath_run()
  Delete four error messages for a failed memory allocation
  Reduce indentation for four lines in multipath_run()
  Less function calls in multipath_run() after error detection
  Delete 13 unwanted spaces behind function names
  Delete two unwanted spaces behind asterisks
  Replace a seq_printf() call by seq_puts() in multipath_status()
  Adjust two function calls together with a variable assignment
  Add some spaces for better code readability
  Move a brace for a designated initialiser
  Delete an unnecessary return statement in multipath_make_request()
  Replace printk() calls by the usage of higher level interfaces

 drivers/md/multipath.c | 192 +++++++++++++++++++++++--------------------------
 1 file changed, 88 insertions(+), 104 deletions(-)

-- 
2.10.0

