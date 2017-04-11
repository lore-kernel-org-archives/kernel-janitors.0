From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 11 Apr 2017 17:00:07 +0000
Subject: [PATCH 0/2] TTY: small adjustments for the ePAPR hypervisor byte channel device driver
Message-Id: <4666b729-217c-ab28-4a3c-25ef703054dd@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 11 Apr 2017 18:54:03 +0200

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Use kcalloc() in ehv_bc_init()
  Fix a typo in two comment lines

 drivers/tty/ehv_bytechan.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
2.12.2

