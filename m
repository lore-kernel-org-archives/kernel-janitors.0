From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 09 Dec 2017 19:10:15 +0000
Subject: [PATCH 0/3] tty/serial/ifx6x60: Adjustments for five function implementations
Message-Id: <992f55e5-961d-79ea-a6cd-441ceb3ad058@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-serial@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 9 Dec 2017 20:03:45 +0100

Three update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Delete an error message for a failed memory allocation in ifx_spi_spi_probe()
  Improve a size determination in ifx_spi_spi_probe()
  Add some spaces for better code readability

 drivers/tty/serial/ifx6x60.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

-- 
2.15.1

