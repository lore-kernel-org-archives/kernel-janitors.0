From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 10 Jan 2018 14:03:23 +0000
Subject: [PATCH 0/3] SGI-XPC: Adjustments for some function implementations
Message-Id: <cf88f891-5960-ff01-b8b5-b8194ceff4f1@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Robin Holt <robinmholt@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 10 Jan 2018 14:54:34 +0100

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Delete error messages for a failed memory allocation in three functions
  Improve a size determination in two functions
  Adjust 27 checks for null pointers

 drivers/misc/sgi-xp/xpc_main.c | 16 +++++-------
 drivers/misc/sgi-xp/xpc_uv.c   | 59 ++++++++++++++++++------------------------
 2 files changed, 31 insertions(+), 44 deletions(-)

-- 
2.15.1

