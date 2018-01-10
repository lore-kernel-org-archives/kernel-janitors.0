From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 10 Jan 2018 15:30:58 +0000
Subject: [PATCH 0/3] misc/TI-ST: Adjustments for three function implementations
Message-Id: <b038e780-8cd2-a550-108c-2f8a35f3571e@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Arvind Yadav <arvind.yadav.cs@gmail.com>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johannes Berg <johannes.berg@intel.com>, Stephen Hemminger <stephen@networkplumber.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 10 Jan 2018 16:26:36 +0100

Three update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Delete an error message for a failed memory allocation in kim_probe()
  Improve a size determination in kim_probe()
  Delete an unnecessary return statement in two functions

 drivers/misc/ti-st/st_kim.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

-- 
2.15.1

