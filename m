From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 08 Jan 2018 09:40:10 +0000
Subject: [PATCH 0/3] GenWQE: Adjustments for some function implementations
Message-Id: <e1b73b1a-ae0a-b76b-33d7-4dc5af8e39b5@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Frank Haverkamp <haver@linux.vnet.ibm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Guilherme G. Piccoli" <gpiccoli@linux.vnet.ibm.com>
Cc: LKML <linux-kernel@vger.kernel.org>, =?UTF-8?Q?J=c3=b6rg-Stephan_Vogt?= <jsvogt@de.ibm.com>, Michael Jung <MIJUNG@de.ibm.com>, =?UTF-8?Q?Michael_R=c3=bcttger?= <michael@ibmra.de>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 8 Jan 2018 10:32:23 +0100

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Delete an error message for a failed memory allocation in genwqe_user_vmap()
  Fix a typo in two comments
  Adjust 12 checks for null pointers

 drivers/misc/genwqe/card_utils.c | 34 +++++++++++++++-------------------
 1 file changed, 15 insertions(+), 19 deletions(-)

-- 
2.15.1

