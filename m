From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 13 Apr 2020 07:34:47 +0000
Subject: [PATCH RESEND] MAINTAINERS: rectify EDAC-SIFIVE entry
Message-Id: <20200413073447.9284-1-lukas.bulwahn@gmail.com>
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

v1: https://lore.kernel.org/lkml/20200304144045.15060-1-lukas.bulwahn@gmail.com/
  - was not picked up.

v1-resend: applies on v5.7-rc1

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e64e5db31497..e28676766b26 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6172,7 +6172,7 @@ M:	Yash Shah <yash.shah@sifive.com>
 L:	linux-edac@vger.kernel.org
 S:	Supported
 F:	drivers/edac/sifive_edac.c
-F:	drivers/soc/sifive_l2_cache.c
+F:	drivers/soc/sifive/sifive_l2_cache.c
 
 EDAC-SKYLAKE
 M:	Tony Luck <tony.luck@intel.com>
-- 
2.17.1
