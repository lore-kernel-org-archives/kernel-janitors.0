From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 10 Dec 2017 15:30:18 +0000
Subject: [PATCH 0/2] tty-MOXA: Adjustments for moxa_init_board()
Message-Id: <7d1badbd-8bb1-4109-5c40-1ba1f226a2b1@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 10 Dec 2017 16:25:43 +0100

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete an error message for a failed memory allocation
  Return directly after a failed kcalloc()

 drivers/tty/moxa.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

-- 
2.15.1

