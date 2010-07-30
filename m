From: Kulikov Vasiliy <segooon@gmail.com>
Date: Fri, 30 Jul 2010 11:07:42 +0000
Subject: [PATCH 2/9] staging: octeon: check request_irq() return value
Message-Id: <1280488062-20737-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Ralf Baechle <ralf@linux-mips.org>, David Daney <ddaney@caviumnetworks.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

request_irq() may fail, if so propagate error code.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/staging/octeon/ethernet-spi.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/staging/octeon/ethernet-spi.c b/drivers/staging/octeon/ethernet-spi.c
index b58b897..9708254 100644
--- a/drivers/staging/octeon/ethernet-spi.c
+++ b/drivers/staging/octeon/ethernet-spi.c
@@ -294,6 +294,8 @@ int cvm_oct_spi_init(struct net_device *dev)
 	if (number_spi_ports = 0) {
 		r = request_irq(OCTEON_IRQ_RML, cvm_oct_spi_rml_interrupt,
 				IRQF_SHARED, "SPI", &number_spi_ports);
+		if (r)
+			return r;
 	}
 	number_spi_ports++;
 
-- 
1.7.0.4

