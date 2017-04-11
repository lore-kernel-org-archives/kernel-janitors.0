From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 11 Apr 2017 18:26:01 +0000
Subject: [PATCH 0/2] TTY-goldfish: small adjustments for two function implementations
Message-Id: <53ab1654-e0ef-1227-cef2-32dbedcdc124@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 11 Apr 2017 20:22:10 +0200

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Use kcalloc() in goldfish_tty_create_driver()
  Adjust five checks for null pointers

 drivers/tty/goldfish.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

-- 
2.12.2

