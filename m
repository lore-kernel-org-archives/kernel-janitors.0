From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 21 Aug 2016 13:50:41 +0000
Subject: [PATCH 0/7] USB-iowarrior: Fine-tuning for some function implementations
Message-Id: <5f6dd0dd-820e-c3d3-a88d-a16ad5e64aa8@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
In-Reply-To: <566ABCD9.1060404@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-usb@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Josh Boyer <jwboyer@fedoraproject.org>, Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 21 Aug 2016 15:41:23 +0200

Several update suggestions were taken into account
from static source code analysis.

Markus Elfring (7):
  Use memdup_user() rather than duplicating its implementation
  Delete unnecessary initialisations for the variable "dev"
  Delete an unnecessary initialisation in iowarrior_release()
  Delete unnecessary initialisations in iowarrior_open()
  Delete unnecessary initialisations in iowarrior_write()
  Delete unnecessary braces
  Apply another recommendation from "checkpatch.pl"

 drivers/usb/misc/iowarrior.c | 53 ++++++++++++++++++--------------------------
 1 file changed, 22 insertions(+), 31 deletions(-)

-- 
2.9.3

