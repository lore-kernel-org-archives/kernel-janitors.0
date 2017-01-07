From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 07 Jan 2017 19:50:15 +0000
Subject: [PATCH 0/9] memstick: Fine-tuning for some function implementations
Message-Id: <64dfa775-4e4a-bdb0-7b55-41f43ccdf11a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maxim Levitsky <maximlevitsky@gmail.com>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 7 Jan 2017 20:44:20 +0100

Some update suggestions were taken into account
from static source code analysis.

Markus Elfring (9):
  Split a condition check in msb_ftl_initialize()
  Use kmalloc_array() in msb_ftl_initialize()
  Delete unwanted spaces behind three function parameters
  Improve two size determinations in msb_resume()
  Delete an unnecessary variable initialisation in msb_resume()
  Improve a size determination in msb_probe()
  Improve another size determination in msb_read_boot_blocks()
  Delete an unnecessary variable initialisation in msb_read_boot_blocks()
  Delete an unnecessary check in msb_update_block()

 drivers/memstick/core/ms_block.c | 57 ++++++++++++++++++++++------------------
 1 file changed, 32 insertions(+), 25 deletions(-)

-- 
2.11.0

