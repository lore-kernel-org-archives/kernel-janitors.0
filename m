From: Peter Huewe <PeterHuewe@gmx.de>
Date: Tue, 22 Dec 2009 08:41:42 +0000
Subject: [PATCH 03/10] isdn/mISDN: add __init/__exit macros to drivers/isdn/mISDN/dsp_core.c
Message-Id: <200912220941.42370.PeterHuewe@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Kosina <trivial@kernel.org>, linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Peter Huewe <peterhuewe@gmx.de>, Karsten Keil <isdn@linux-pingi.de>, Andreas Eversberg <andreas@eversberg.eu>, "David S. Miller" <davem@davemloft.net>

From: Peter Huewe <peterhuewe@gmx.de>

Trivial patch which adds the __init/__exit macros to the module_init/
module_exit functions of

drivers/isdn/mISDN/dsp_core.c

Please have a look at the small patch and either pull it through
your tree, or please ack' it so Jiri can pull it through the trivial
tree.

Patch against linux-next-tree, 22. Dez 08:38:18 CET 2009
but also present in linus tree.

Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
---
 drivers/isdn/mISDN/dsp_core.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/isdn/mISDN/dsp_core.c b/drivers/isdn/mISDN/dsp_core.c
index 43ff4d3..6eac588 100644
--- a/drivers/isdn/mISDN/dsp_core.c
+++ b/drivers/isdn/mISDN/dsp_core.c
@@ -1114,7 +1114,7 @@ static struct Bprotocol DSP = {
 	.create = dspcreate
 };
 
-static int dsp_init(void)
+static int __init dsp_init(void)
 {
 	int err;
 	int tics;
@@ -1212,7 +1212,7 @@ static int dsp_init(void)
 }
 
 
-static void dsp_cleanup(void)
+static void __exit dsp_cleanup(void)
 {
 	mISDN_unregister_Bprotocol(&DSP);
 
-- 
1.6.4.4

