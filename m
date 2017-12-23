From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 23 Dec 2017 21:36:56 +0000
Subject: [PATCH 0/3] Pinctrl-Rockchip: Adjustments for six functions
Message-Id: <323697d0-e1e8-8d3b-1070-f481cfa30b9a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 23 Dec 2017 22:33:44 +0100

Three update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Delete error messages for a failed memory allocation in two functions
  Improve a size determination in rockchip_pinctrl_probe()
  Fix a typo in four comment lines

 drivers/pinctrl/pinctrl-rockchip.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

-- 
2.15.1

