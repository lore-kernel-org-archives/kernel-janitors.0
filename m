From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 16 Oct 2017 15:02:53 +0000
Subject: [PATCH 0/4] char-SNSC: Adjustments for six function implementations
Message-Id: <cbedda27-97e7-7b11-b888-39e09f7deaa1@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 16 Oct 2017 17:00:02 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (4):
  Adjust one function call together with a variable assignment
  Delete three error messages for a failed memory allocation
  Improve a size determination in two functions
  Delete unnecessary braces in five functions

 drivers/char/snsc.c | 50 ++++++++++++++++++--------------------------------
 1 file changed, 18 insertions(+), 32 deletions(-)

-- 
2.14.2

