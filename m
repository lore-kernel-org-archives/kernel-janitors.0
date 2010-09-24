From: matt mooney <mfm@muteddisk.com>
Date: Fri, 24 Sep 2010 19:17:17 +0000
Subject: [PATCH 07/24] ieee802154: change to new flag variable
Message-Id: <40a2d76d013ad025d08a411992af10f6bbef0a13.1285355033.git.mfm@muteddisk.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e0bdab5d2e8c52041c003de68ba774c3e706716c.1285355033.git.mfm@muteddisk.com>
 <9968d4260be8850200cc9c7dfe08addf611468b4.1285355033.git.mfm@muteddisk.com>
 <036514b5dd23c5af14303519d79d60d79adccbee.1285355033.git.mfm@muteddisk.com>
 <ffbd189ef2d414ea7c87ffe2b40fce87877dc014.1285355033.git.mfm@muteddisk.com>
 <b3e2061e1e6703f7b84c0484030e07de6000546a.1285355033.git.mfm@muteddisk.com>
 <70fe6b462b3ee22922698a12d62d650cf029033a.1285355033.git.mfm@muteddisk.com>
In-Reply-To: <70fe6b462b3ee22922698a12d62d650cf029033a.1285355033.git.mfm@muteddisk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, Sergey Lapin <slapin@ossfans.org>, linux-zigbee-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org

Replace EXTRA_CFLAGS with ccflags-y.

Signed-off-by: matt mooney <mfm@muteddisk.com>
---
 drivers/ieee802154/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/ieee802154/Makefile b/drivers/ieee802154/Makefile
index e0e8e1a..6899913 100644
--- a/drivers/ieee802154/Makefile
+++ b/drivers/ieee802154/Makefile
@@ -1,3 +1,3 @@
 obj-$(CONFIG_IEEE802154_FAKEHARD) += fakehard.o
 
-EXTRA_CFLAGS += -DDEBUG -DCONFIG_FFD
+ccflags-y := -DDEBUG -DCONFIG_FFD
-- 
1.7.2.1

