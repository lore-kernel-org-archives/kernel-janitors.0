From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 13 May 2017 08:54:03 +0000
Subject: [PATCH 0/2] Industry-pack bus: Adjustments for two function implementations
Message-Id: <b3fea957-b1bf-f681-8f70-d9d85106651b@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: industrypack-devel@lists.sourceforge.net, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jens Taprogge <jens.taprogge@taprogge.org>, Samuel Iglesias Gonsalvez <siglesias@igalia.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 13 May 2017 10:45:54 +0200

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete an error message for a failed memory allocation in ipack_device_read_id()
  Improve a size determination in ipack_bus_register()

 drivers/ipack/ipack.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

-- 
2.12.3

