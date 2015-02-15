From: Silvan Jegen <s.jegen@gmail.com>
Date: Sun, 15 Feb 2015 12:11:03 +0000
Subject: [PATCH 0/2] [media] mantis: Fix goto labels
Message-Id: <1424002265-16865-1-git-send-email-s.jegen@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@osg.samsung.com>, linux-media@vger.kernel.org
Cc: Silvan Jegen <s.jegen@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

I found two issues regarding goto labels in the mantis driver
when checking a smatch warning and addressed them in two separate
patches. Please be aware that these patches have only been compile-tested
since I do not have access to the corresponding hardware.

Silvan Jegen (2):
  [media] mantis: Move jump label to activate dead code
  [media] mantis: Use correct goto labels for cleanup on error

 drivers/media/pci/mantis/mantis_cards.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

-- 
2.2.2

