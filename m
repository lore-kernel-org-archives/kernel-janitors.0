From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 18 Aug 2019 15:51:24 +0000
Subject: [PATCH] MIPS: Octeon: Fix a typo in #define OCTOEN_SERIAL_LEN
Message-Id: <20190818155124.3750-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

It should be OCTEON_SERIAL_LEN.
Update the #define and use it accordingly

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 arch/mips/include/asm/octeon/octeon.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/octeon/octeon.h b/arch/mips/include/asm/octeon/octeon.h
index 60481502826a..a2e2876357ce 100644
--- a/arch/mips/include/asm/octeon/octeon.h
+++ b/arch/mips/include/asm/octeon/octeon.h
@@ -51,7 +51,7 @@ extern void octeon_setup_delays(void);
 extern void octeon_io_clk_delay(unsigned long);
 
 #define OCTEON_ARGV_MAX_ARGS	64
-#define OCTOEN_SERIAL_LEN	20
+#define OCTEON_SERIAL_LEN	20
 
 struct octeon_boot_descriptor {
 #ifdef __BIG_ENDIAN_BITFIELD
@@ -102,7 +102,7 @@ struct octeon_boot_descriptor {
 	uint16_t chip_type;
 	uint8_t chip_rev_major;
 	uint8_t chip_rev_minor;
-	char board_serial_number[OCTOEN_SERIAL_LEN];
+	char board_serial_number[OCTEON_SERIAL_LEN];
 	uint8_t mac_addr_base[6];
 	uint8_t mac_addr_count;
 	uint64_t cvmx_desc_vaddr;
-- 
2.20.1
