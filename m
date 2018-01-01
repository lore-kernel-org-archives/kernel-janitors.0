From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 01 Jan 2018 17:52:36 +0000
Subject: [PATCH 0/2] benet: Adjustments for two function implementations
Message-Id: <86e577a3-77a4-2e74-dd2d-4d63e90ffb72@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, Ajit Khaparde <ajit.khaparde@broadcom.com>, Sathya Perla <sathya.perla@broadcom.com>, Somnath Kotur <somnath.kotur@broadcom.com>, Sriharsha Basavapatna <sriharsha.basavapatna@broadcom.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 1 Jan 2018 18:50:05 +0100

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete an error message for a failed memory allocation in be_alloc_work()
  Delete an unnecessary return statement in be_work_add_vxlan_port()

 drivers/net/ethernet/emulex/benet/be_main.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

-- 
2.15.1

