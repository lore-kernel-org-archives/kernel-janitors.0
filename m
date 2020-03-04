From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Wed, 04 Mar 2020 14:40:45 +0000
Subject: [PATCH] MAINTAINERS: rectify EDAC-SIFIVE entry
Message-Id: <20200304144045.15060-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Christoph Hellwig <hch@lst.de>, Borislav Petkov <bp@suse.de>, Yash Shah <yash.shah@sifive.com>, linux-edac@vger.kernel.org, Sebastian Duda <sebastian.duda@fau.de>, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

Commit 9209fb51896f ("riscv: move sifive_l2_cache.c to drivers/soc") moved
arch/riscv/mm/sifive_l2_cache.c to drivers/soc/sifive/sifive_l2_cache.c
and adjusted the MAINTAINERS EDAC-SIFIVE entry but slipped in a mistake.

Since then, ./scripts/get_maintainer.pl --self-test complains:

  warning: no file matches F: drivers/soc/sifive_l2_cache.c

Rectify the EDAC-SIFIVE entry in MAINTAINERS now.

Co-developed-by: Sebastian Duda <sebastian.duda@fau.de>
Signed-off-by: Sebastian Duda <sebastian.duda@fau.de>
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Paul, please pick this patch.

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6158a143a13e..5c755e03ddee 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6110,7 +6110,7 @@ M:	Yash Shah <yash.shah@sifive.com>
 L:	linux-edac@vger.kernel.org
 S:	Supported
 F:	drivers/edac/sifive_edac.c
-F:	drivers/soc/sifive_l2_cache.c
+F:	drivers/soc/sifive/sifive_l2_cache.c
 
 EDAC-SKYLAKE
 M:	Tony Luck <tony.luck@intel.com>
-- 
2.17.1
