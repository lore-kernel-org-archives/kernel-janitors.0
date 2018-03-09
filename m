From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 09 Mar 2018 16:10:36 +0000
Subject: [PATCH v2 0/2] mfd/sm501: Adjustments for five function implementations
Message-Id: <5271ab9f-3be1-035c-90c1-8faba2e119b8@users.sourceforge.net>
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

Markus Elfring (2):
  Improve a size determination in two functions
  Adjust 12 checks for null pointers
---

v2:
Lee Jones requested a resend for these patches. The changes were rebased
on source files from Linux next-20180308.

 drivers/mfd/sm501.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

-- 
2.15.1

