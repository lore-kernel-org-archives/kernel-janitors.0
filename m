From: Tobias Klauser <tklauser@distanz.ch>
Date: Thu, 20 May 2010 08:39:00 +0000
Subject: [PATCH 08/11] mfd: timberdale: Storage class should be before const qualifier
Message-Id: <1274344740-9153-1-git-send-email-tklauser@distanz.ch>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The C99 specification states in section 6.11.5:

The placement of a storage-class specifier other than at the beginning
of the declaration specifiers in a declaration is an obsolescent
feature.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 drivers/mfd/timberdale.c |   20 ++++++++++----------
 1 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/mfd/timberdale.c b/drivers/mfd/timberdale.c
index 2d4691a..ac59950 100644
--- a/drivers/mfd/timberdale.c
+++ b/drivers/mfd/timberdale.c
@@ -86,7 +86,7 @@ timberdale_ocores_platform_data = {
 	.num_devices = ARRAY_SIZE(timberdale_i2c_board_info)
 };
 
-const static __devinitconst struct resource timberdale_xiic_resources[] = {
+static const __devinitconst struct resource timberdale_xiic_resources[] = {
 	{
 		.start	= XIICOFFSET,
 		.end	= XIICEND,
@@ -99,7 +99,7 @@ const static __devinitconst struct resource timberdale_xiic_resources[] = {
 	},
 };
 
-const static __devinitconst struct resource timberdale_ocores_resources[] = {
+static const __devinitconst struct resource timberdale_ocores_resources[] = {
 	{
 		.start	= OCORESOFFSET,
 		.end	= OCORESEND,
@@ -148,7 +148,7 @@ static __devinitdata struct xspi_platform_data timberdale_xspi_platform_data = {
 	 */
 };
 
-const static __devinitconst struct resource timberdale_spi_resources[] = {
+static const __devinitconst struct resource timberdale_spi_resources[] = {
 	{
 		.start 	= SPIOFFSET,
 		.end	= SPIEND,
@@ -161,7 +161,7 @@ const static __devinitconst struct resource timberdale_spi_resources[] = {
 	},
 };
 
-const static __devinitconst struct resource timberdale_eth_resources[] = {
+static const __devinitconst struct resource timberdale_eth_resources[] = {
 	{
 		.start	= ETHOFFSET,
 		.end	= ETHEND,
@@ -181,7 +181,7 @@ static __devinitdata struct timbgpio_platform_data
 	.irq_base = 200,
 };
 
-const static __devinitconst struct resource timberdale_gpio_resources[] = {
+static const __devinitconst struct resource timberdale_gpio_resources[] = {
 	{
 		.start	= GPIOOFFSET,
 		.end	= GPIOEND,
@@ -194,7 +194,7 @@ const static __devinitconst struct resource timberdale_gpio_resources[] = {
 	},
 };
 
-const static __devinitconst struct resource timberdale_mlogicore_resources[] = {
+static const __devinitconst struct resource timberdale_mlogicore_resources[] = {
 	{
 		.start	= MLCOREOFFSET,
 		.end	= MLCOREEND,
@@ -212,7 +212,7 @@ const static __devinitconst struct resource timberdale_mlogicore_resources[] = {
 	},
 };
 
-const static __devinitconst struct resource timberdale_uart_resources[] = {
+static const __devinitconst struct resource timberdale_uart_resources[] = {
 	{
 		.start	= UARTOFFSET,
 		.end	= UARTEND,
@@ -225,7 +225,7 @@ const static __devinitconst struct resource timberdale_uart_resources[] = {
 	},
 };
 
-const static __devinitconst struct resource timberdale_uartlite_resources[] = {
+static const __devinitconst struct resource timberdale_uartlite_resources[] = {
 	{
 		.start	= UARTLITEOFFSET,
 		.end	= UARTLITEEND,
@@ -238,7 +238,7 @@ const static __devinitconst struct resource timberdale_uartlite_resources[] = {
 	},
 };
 
-const static __devinitconst struct resource timberdale_radio_resources[] = {
+static const __devinitconst struct resource timberdale_radio_resources[] = {
 	{
 		.start	= RDSOFFSET,
 		.end	= RDSEND,
@@ -331,7 +331,7 @@ static __devinitdata struct timb_dma_platform_data timb_dma_platform_data = {
 	}
 };
 
-const static __devinitconst struct resource timberdale_dma_resources[] = {
+static const __devinitconst struct resource timberdale_dma_resources[] = {
 	{
 		.start	= DMAOFFSET,
 		.end	= DMAEND,
-- 
1.6.3.3

