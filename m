From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 30 May 2013 21:24:02 +0000
Subject: build regressions 2013-05-30
Message-Id: <51a7c372.QlhOriTCtz6r/ZPt%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/spi/spi-imx.c:706:9: error: expected '=', ',', ';', 'asm' or '__attribute__' before '->' token
drivers/spi/spi-imx.c:708:2: error: expected identifier or '(' before 'return'
drivers/spi/spi-imx.c:709:1: error: expected identifier or '(' before '}' token
drivers/block/nvme-core.c:1681:9: error: too many arguments to function 'pci_enable_msi_block'
dwc3-omap.c:(.text+0x8c831): undefined reference to `extcon_get_cable_state'
dwc3-omap.c:(.text+0x8c851): undefined reference to `extcon_get_cable_state'
drivers/net/wireless/cw1200/main.c:237:2: error: unknown field 'suspend' specified in initializer
drivers/net/wireless/cw1200/main.c:238:2: error: unknown field 'resume' specified in initializer
drivers/net/wireless/cw1200/main.c:296:11: error: 'struct wiphy' has no member named 'wowlan'
drivers/net/wireless/cw1200/main.c:298:11: error: 'struct wiphy' has no member named 'wowlan'
drivers/spi/spi-fsl-espi.c:162:13: error: expected '=', ',', ';', 'asm' or '__attribute__' before '->' token
drivers/spi/spi-fsl-espi.c:163:13: error: expected '=', ',', ';', 'asm' or '__attribute__' before '->' token
drivers/spi/spi-fsl-espi.c:164:13: error: expected '=', ',', ';', 'asm' or '__attribute__' before '->' token
drivers/spi/spi-fsl-espi.c:165:13: error: expected '=', ',', ';', 'asm' or '__attribute__' before '->' token
drivers/spi/spi-fsl-espi.c:167:2: error: initializer element is not constant
drivers/spi/spi-fsl-espi.c:170:4: error: expected '=', ',', ';', 'asm' or '__attribute__' before '->' token
drivers/spi/spi-fsl-espi.c:172:4: error: expected '=', ',', ';', 'asm' or '__attribute__' before '->' token
drivers/spi/spi-fsl-espi.c:174:2: error: expected identifier or '(' before 'if'
drivers/spi/spi-fsl-espi.c:183:4: error: expected identifier or '(' before 'else'
drivers/spi/spi-fsl-espi.c:186:2: error: expected identifier or '(' before 'if'
drivers/spi/spi-fsl-espi.c:188:2: error: expected identifier or '(' before 'if'
drivers/spi/spi-fsl-espi.c:191:4: error: expected '=', ',', ';', 'asm' or '__attribute__' before '->' token
drivers/spi/spi-fsl-espi.c:193:2: error: conflicting types for 'fsl_espi_change_mode'
drivers/spi/spi-fsl-espi.c:194:2: error: expected identifier or '(' before 'return'
drivers/spi/spi-fsl-espi.c:195:1: error: expected identifier or '(' before '}' token
sound/soc/codecs/wm0010.c:975:2: error: implicit declaration of function 'irq_set_irq_wake' [-Werror=implicit-function-declaration]

[warnings]
drivers/spi/spi-imx.c:704:2: warning: no return statement in function returning non-void [-Wreturn-type]
drivers/spi/spi-imx.c:785:2: warning: left shift count >= width of type [enabled by default]
drivers/spi/spi-omap2-mcspi.c:1190:2: warning: left shift count >= width of type [enabled by default]
drivers/block/nvme-core.c:1681:9: warning: passing argument 2 of 'pci_enable_msi_block' makes integer from pointer without a cast [enabled by default]
drivers/spi/spi-gpio.c:446:2: warning: left shift count >= width of type [enabled by default]
drivers/spi/spi-pxa2xx.c:1181:3: warning: left shift count >= width of type [enabled by default]
lib/list_lru.c:75:24: warning: unused variable 'nlru' [-Wunused-variable]
drivers/net/wireless/cw1200/main.c:237:2: warning: initialization from incompatible pointer type [enabled by default]
drivers/net/wireless/cw1200/main.c:237:2: warning: (near initialization for 'cw1200_ops.channel_switch') [enabled by default]
drivers/net/wireless/cw1200/main.c:238:2: warning: initialization from incompatible pointer type [enabled by default]
drivers/net/wireless/cw1200/main.c:238:2: warning: (near initialization for 'cw1200_ops.napi_poll') [enabled by default]
drivers/usb/musb/musb_host.c:1763:4: warning: format '%x' expects argument of type 'unsigned int', but argument 6 has type 'dma_addr_t' [-Wformat]
drivers/spi/spi-fsl-espi.c:160:2: warning: no return statement in function returning non-void [-Wreturn-type]
drivers/spi/spi-fsl-espi.c:167:2: warning: data definition has no type or storage class [enabled by default]
drivers/spi/spi-fsl-espi.c:167:2: warning: type defaults to 'int' in declaration of 'bits_per_word' [-Wimplicit-int]
drivers/spi/spi-fsl-espi.c:193:2: warning: data definition has no type or storage class [enabled by default]
drivers/spi/spi-fsl-espi.c:193:2: warning: type defaults to 'int' in declaration of 'fsl_espi_change_mode' [-Wimplicit-int]
drivers/spi/spi-fsl-espi.c:193:2: warning: parameter names (without types) in function declaration [enabled by default]

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
