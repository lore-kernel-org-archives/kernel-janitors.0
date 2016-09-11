From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 11 Sep 2016 13:06:05 +0000
Subject: [PATCH 23/26] sh_eth: constify local structures
Message-Id: <1473599168-30561-24-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1473599168-30561-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1473599168-30561-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: joe@perches.com, kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org

For structure types defined in the same file or local header files, find
top-level static structure declarations that have the following
properties:
1. Never reassigned.
2. Address never taken
3. Not passed to a top-level macro call
4. No pointer or array-typed field passed to a function or stored in a
variable.
Declare structures having all of these properties as const.

Done using Coccinelle.
Based on a suggestion by Joe Perches <joe@perches.com>.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
The semantic patch seems too long for a commit log, but is in the cover
letter.

 drivers/net/ethernet/renesas/sh_eth.c |   14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/renesas/sh_eth.c b/drivers/net/ethernet/renesas/sh_eth.c
index 1f8240a..d2ed57f 100644
--- a/drivers/net/ethernet/renesas/sh_eth.c
+++ b/drivers/net/ethernet/renesas/sh_eth.c
@@ -654,7 +654,7 @@ static void sh_eth_set_rate_sh7724(struct net_device *ndev)
 }
 
 /* SH7724 */
-static struct sh_eth_cpu_data sh7724_data = {
+static const struct sh_eth_cpu_data sh7724_data = {
 	.set_duplex	= sh_eth_set_duplex,
 	.set_rate	= sh_eth_set_rate_sh7724,
 
@@ -692,7 +692,7 @@ static void sh_eth_set_rate_sh7757(struct net_device *ndev)
 }
 
 /* SH7757 */
-static struct sh_eth_cpu_data sh7757_data = {
+static const struct sh_eth_cpu_data sh7757_data = {
 	.set_duplex	= sh_eth_set_duplex,
 	.set_rate	= sh_eth_set_rate_sh7757,
 
@@ -757,7 +757,7 @@ static void sh_eth_set_rate_giga(struct net_device *ndev)
 }
 
 /* SH7757(GETHERC) */
-static struct sh_eth_cpu_data sh7757_data_giga = {
+static const struct sh_eth_cpu_data sh7757_data_giga = {
 	.chip_reset	= sh_eth_chip_reset_giga,
 	.set_duplex	= sh_eth_set_duplex,
 	.set_rate	= sh_eth_set_rate_giga,
@@ -788,7 +788,7 @@ static struct sh_eth_cpu_data sh7757_data_giga = {
 };
 
 /* SH7734 */
-static struct sh_eth_cpu_data sh7734_data = {
+static const struct sh_eth_cpu_data sh7734_data = {
 	.chip_reset	= sh_eth_chip_reset,
 	.set_duplex	= sh_eth_set_duplex,
 	.set_rate	= sh_eth_set_rate_gether,
@@ -817,7 +817,7 @@ static struct sh_eth_cpu_data sh7734_data = {
 };
 
 /* SH7763 */
-static struct sh_eth_cpu_data sh7763_data = {
+static const struct sh_eth_cpu_data sh7763_data = {
 	.chip_reset	= sh_eth_chip_reset,
 	.set_duplex	= sh_eth_set_duplex,
 	.set_rate	= sh_eth_set_rate_gether,
@@ -844,7 +844,7 @@ static struct sh_eth_cpu_data sh7763_data = {
 	.irq_flags	= IRQF_SHARED,
 };
 
-static struct sh_eth_cpu_data sh7619_data = {
+static const struct sh_eth_cpu_data sh7619_data = {
 	.register_type	= SH_ETH_REG_FAST_SH3_SH2,
 
 	.eesipr_value	= DMAC_M_RFRMER | DMAC_M_ECI | 0x003fffff,
@@ -855,7 +855,7 @@ static struct sh_eth_cpu_data sh7619_data = {
 	.hw_swap	= 1,
 };
 
-static struct sh_eth_cpu_data sh771x_data = {
+static const struct sh_eth_cpu_data sh771x_data = {
 	.register_type	= SH_ETH_REG_FAST_SH3_SH2,
 
 	.eesipr_value	= DMAC_M_RFRMER | DMAC_M_ECI | 0x003fffff,

