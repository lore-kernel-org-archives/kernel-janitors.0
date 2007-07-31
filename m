From: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Date: Tue, 31 Jul 2007 17:58:20 +0000
Subject: [PATCH 30] drivers/ide/arm/icside.c: kmalloc + memset conversion to kzalloc
Message-Id: <200707311958.20683.m.kozlowski@tuxland.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707311845.48807.m.kozlowski@tuxland.pl>
In-Reply-To: <200707311845.48807.m.kozlowski@tuxland.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, rmk@arm.linux.org.uk

Is this a bug? In original verison memset cleared sizeof(state) bytes
instead of sizeof(*state). If it was intentional then this patch is invalid.
If not intentional -> valid :) Please review.

Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>

 drivers/ide/arm/icside.c | 18883 -> 18849 (-34 bytes)

 drivers/ide/arm/icside.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

--- linux-2.6.23-rc1-mm1-a/drivers/ide/arm/icside.c	2007-07-26 13:07:41.000000000 +0200
+++ linux-2.6.23-rc1-mm1-b/drivers/ide/arm/icside.c	2007-07-31 11:32:27.000000000 +0200
@@ -682,13 +682,12 @@ icside_probe(struct expansion_card *ec,
 	if (ret)
 		goto out;

-	state = kmalloc(sizeof(struct icside_state), GFP_KERNEL);
+	state = kzalloc(sizeof(struct icside_state), GFP_KERNEL);
 	if (!state) {
 		ret = -ENOMEM;
 		goto release;
 	}

-	memset(state, 0, sizeof(state));
 	state->type	= ICS_TYPE_NOTYPE;
 	state->dev	= &ec->dev;

