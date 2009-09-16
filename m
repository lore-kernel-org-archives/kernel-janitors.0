From: Julia Lawall <julia@diku.dk>
Date: Wed, 16 Sep 2009 09:06:52 +0000
Subject: [PATCH] arch/arm: adjust duplicate structure field initialization
Message-Id: <Pine.LNX.4.64.0909161105580.8590@pc-004.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Russell King <linux@arm.linux.org.uk>, Eric Miao <eric.y.miao@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Currently the irq_type field of the csb726_lan_config structure is
initialized twice.  The value in the first case,
SMSC911X_IRQ_POLARITY_ACTIVE_LOW, is normally stored in the irq_polarity
field, so I have renamed the field in the first initialization to that.

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 arch/arm/mach-pxa/csb726.c          |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-pxa/csb726.c b/arch/arm/mach-pxa/csb726.c
index 79141f8..965480e 100644
--- a/arch/arm/mach-pxa/csb726.c
+++ b/arch/arm/mach-pxa/csb726.c
@@ -238,7 +238,7 @@ static struct resource csb726_lan_resources[] = {
 };
 
 struct smsc911x_platform_config csb726_lan_config = {
-	.irq_type	= SMSC911X_IRQ_POLARITY_ACTIVE_LOW,
+	.irq_polarity	= SMSC911X_IRQ_POLARITY_ACTIVE_LOW,
 	.irq_type	= SMSC911X_IRQ_TYPE_PUSH_PULL,
 	.flags		= SMSC911X_USE_32BIT,
 	.phy_interface	= PHY_INTERFACE_MODE_MII,
