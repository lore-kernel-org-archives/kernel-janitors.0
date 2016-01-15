From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 15 Jan 2016 13:04:37 +0000
Subject: [PATCH v3 0/3] net-rsi: Fine-tuning for two function implementations
Message-Id: <5698EE65.7010607@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <5687E169.4070704@users.sourceforge.net>
In-Reply-To: <5687E169.4070704@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, Fariya Fatima <fariyaf@gmail.com>, Jahnavi Meher <jahnavi.meher@gmail.com>, Kalle Valo <kvalo@codeaurora.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, "John W. Linville" <linville@tuxdriver.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 15 Jan 2016 13:54:43 +0100

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Delete unnecessary variable initialisations in rsi_send_mgmt_pkt()
  Delete unnecessary variable initialisations in rsi_send_data_pkt()
  Replace variable initialisations by assignments in rsi_send_data_pkt()

 drivers/net/wireless/rsi/rsi_91x_pkt.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

---

v3: Rebase proposed changes on the source files for the software
    "Linux next-20160114".
    
v2: Unfortunately, the first update step from this series contained
    an inappropriate suggestion.
    Thus fix that.

-- 
2.6.3

