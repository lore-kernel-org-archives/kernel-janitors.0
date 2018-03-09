From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 09 Mar 2018 16:24:36 +0000
Subject: [PATCH v2 0/4] mfd/tps65910: Adjustments for four function implementations
Message-Id: <a00bda19-c38c-6733-31e7-7e1c44eb6c6b@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c5d9751e-3ae8-0b66-821a-0e7f45bb8e1c@users.sourceforge.net>
In-Reply-To: <c5d9751e-3ae8-0b66-821a-0e7f45bb8e1c@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (4):
  Delete an error message for a failed memory allocation in tps65910_parse_dt()
  Delete an unnecessary variable initialisation in four functions
  Delete an unnecessary variable initialisation in tps65910_sleepinit()
  Move an assignment in tps65910_sleepinit()
---

v2:
Lee Jones requested a resend for these patches. The changes were rebased
on source files from Linux next-20180308.

 drivers/mfd/tps65910.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

-- 
2.15.1

