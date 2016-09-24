From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 24 Sep 2016 11:07:38 +0000
Subject: [PATCH 0/2] Input-evdev: Fine-tuning for three function implementations
Message-Id: <92cc52f5-c5e1-cafe-76f2-04e4ed997735@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
In-Reply-To: <566ABCD9.1060404@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-input@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Henrik Rydberg <rydberg@bitmath.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 24 Sep 2016 13:03:13 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Use kmalloc_array()
  Rename a jump label in two functions

 drivers/input/evdev.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

-- 
2.10.0

