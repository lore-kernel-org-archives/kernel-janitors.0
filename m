From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 08 Jan 2018 13:07:07 +0000
Subject: [PATCH 0/3] misc-IBM ASM SP: Adjustments for ibmasm_init_one()
Message-Id: <842e4179-dbac-cd43-e320-c5009d896a28@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>, Anton Vasilyev <vasilyev@ispras.ru>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Kosina <jkosina@suse.cz>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 8 Jan 2018 14:01:24 +0100

Three update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Delete an error message for a failed memory allocation
  Improve a size determination
  Adjust two function calls together with a variable assignment

 drivers/misc/ibmasm/module.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

-- 
2.15.1

