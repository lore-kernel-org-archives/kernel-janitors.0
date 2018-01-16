From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 16 Jan 2018 20:38:55 +0000
Subject: [PATCH 0/2] macintosh/rack-meter: Adjustments for rackmeter_probe()
Message-Id: <c11e0a90-a7b2-dddd-7751-7dac3e62215b@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linuxppc-dev@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 16 Jan 2018 21:36:56 +0100

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete an error message for a failed memory allocation
  Improve a size determination

 drivers/macintosh/rack-meter.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

-- 
2.15.1

