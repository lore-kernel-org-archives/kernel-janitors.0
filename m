From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 08 Dec 2017 21:50:16 +0000
Subject: [PATCH 0/3] tty/serial/ioc4: Adjustments for four function implementations
Message-Id: <514232dd-7e91-00f9-b95c-3e8f740090ca@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-serial@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, Pat Gefre <pfg@sgi.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 8 Dec 2017 22:47:43 +0100

Three update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Delete error messages for a failed memory allocation in two functions
  Improve four size determinations
  Adjust three function calls together with a variable assignment

 drivers/tty/serial/ioc4_serial.c | 33 ++++++++++++++-------------------
 1 file changed, 14 insertions(+), 19 deletions(-)

-- 
2.15.1

