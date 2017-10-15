From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 15 Oct 2017 20:07:03 +0000
Subject: [PATCH 0/3] char-bsr: Adjustments for two function implementations
Message-Id: <ff23c201-8043-124e-88fd-25e5abd382fb@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 15 Oct 2017 22:02:34 +0200

Three update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Delete an error message for a failed memory allocation in bsr_add_node()
  Improve a size determination in bsr_add_node()
  Adjust one function call together with a variable assignment

 drivers/char/bsr.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

-- 
2.14.2

