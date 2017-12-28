From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 28 Dec 2017 21:44:32 +0000
Subject: [PATCH 0/3] PCMCIA-CIS: Adjustments for six function implementations
Message-Id: <4eaa454f-8b57-fe0a-4802-3676bc2f582e@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-pcmcia@lists.infradead.org, Bhumika Goyal <bhumirks@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 28 Dec 2017 22:42:10 +0100

Three update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  cistpl: Delete error messages for a failed memory allocation
    in three functions
  cis: Delete an error message for a failed memory allocation
    in two functions
  cis: Improve a size determination in pcmcia_loop_config()

 drivers/pcmcia/cistpl.c     | 12 ++++--------
 drivers/pcmcia/pcmcia_cis.c | 11 ++++-------
 2 files changed, 8 insertions(+), 15 deletions(-)

-- 
2.15.1

