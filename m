From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 03 May 2017 20:35:36 +0000
Subject: [PATCH 0/6] lockdep: Fine-tuning for some function implementations
Message-Id: <3f95acb5-c037-b6fa-7a9b-258b4ae465fb@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 3 May 2017 22:17:03 +0200

Some update suggestions were taken into account
from static source code analysis.

Markus Elfring (6):
  Replace 11 seq_puts() calls by seq_putc()
  Use seq_putc() in seq_header()
  Replace four seq_printf() calls by seq_puts()
  Combine two seq_printf() calls into one call in l_show()
  Improve a size determination in lock_stat_open()
  Add spaces for better code readability

 kernel/locking/lockdep_proc.c | 50 ++++++++++++++++++++-----------------------
 1 file changed, 23 insertions(+), 27 deletions(-)

-- 
2.12.2

