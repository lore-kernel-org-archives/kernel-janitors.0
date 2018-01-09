From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 09 Jan 2018 18:27:21 +0000
Subject: [PATCH 0/5] misc-PTI: Adjustments for some function implementations
Message-Id: <bd359852-a809-280d-3d52-89216edc2058@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 9 Jan 2018 19:06:36 +0100

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (5):
  Delete an error message for a failed memory allocation in two functions
  Fix a typo in five comment lines
  Improve a size determination in two functions
  Adjust 11 checks for null pointers
  Delete an unnecessary return statement in two functions

 drivers/misc/pti.c | 45 +++++++++++++++++++--------------------------
 1 file changed, 19 insertions(+), 26 deletions(-)

-- 
2.15.1

