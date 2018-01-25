From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 25 Jan 2018 18:51:25 +0000
Subject: [PATCH 0/3] Input: ims-pcu: Adjustments for three function implementations
Message-Id: <ff77a871-d30a-e873-ab73-2d80198bfbe7@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-input@vger.kernel.org, Arvind Yadav <arvind.yadav.cs@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Joe Perches <joe@perches.com>, Johan Hovold <johan@kernel.org>, Zhen Lei <thunder.leizhen@huawei.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 25 Jan 2018 19:46:56 +0100

Three update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Delete an error message for a failed memory allocation
    in ims_pcu_buffers_alloc()
  Improve a size determination in two functions
  Delete an unnecessary variable assignment in ims_pcu_setup_gamepad()

 drivers/input/misc/ims-pcu.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

-- 
2.16.1

