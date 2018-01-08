From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 08 Jan 2018 16:10:44 +0000
Subject: [PATCH 0/4] misc-IOC4: Adjustments for ioc4_probe()
Message-Id: <4fb26753-2ae3-7c17-7777-03c6923a1d4b@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Brent Casavant <bcasavan@sgi.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jeremy Higdon <jeremy@sgi.com>, Pat Gefre <pfg@sgi.com>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 8 Jan 2018 17:01:23 +0100

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (4):
  Return -ENOMEM after a failed kmalloc()
  Delete an error message for a failed memory allocation
  Improve a size determination
  Adjust one function call together with a variable assignment

 drivers/misc/ioc4.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

-- 
2.15.1


