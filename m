From: Colin King <colin.king@canonical.com>
Date: Thu, 23 Jan 2020 00:54:22 +0000
Subject: [PATCH] MIPS: OCTEON: octeon-irq: fix spelling mistake "to" -> "too"
Message-Id: <20200123005422.2834063-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paulburton@kernel.org>, linux-mips@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_err message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/mips/cavium-octeon/octeon-irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/cavium-octeon/octeon-irq.c b/arch/mips/cavium-octeon/octeon-irq.c
index f97be32bf699..6bd1e97effdf 100644
--- a/arch/mips/cavium-octeon/octeon-irq.c
+++ b/arch/mips/cavium-octeon/octeon-irq.c
@@ -2193,7 +2193,7 @@ static int octeon_irq_cib_map(struct irq_domain *d,
 	struct octeon_irq_cib_chip_data *cd;
 
 	if (hw >= host_data->max_bits) {
-		pr_err("ERROR: %s mapping %u is to big!\n",
+		pr_err("ERROR: %s mapping %u is too big!\n",
 		       irq_domain_get_of_node(d)->name, (unsigned)hw);
 		return -EINVAL;
 	}
-- 
2.24.0
