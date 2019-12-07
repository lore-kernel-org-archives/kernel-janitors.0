From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sat, 07 Dec 2019 18:27:03 +0000
Subject: [PATCH] MAINTAINERS: fix style in CADENCE I3C MASTER IP entry
Message-Id: <20191207182703.14102-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Przemyslaw Gaj <pgaj@cadence.com>, Boris Brezillon <boris.brezillon@collabora.com>
Cc: rafalc@cadence.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, vitor.soares@synopsys.com, Lukas Bulwahn <lukas.bulwahn@gmail.com>, linux-i3c@lists.infradead.org, agolec@cadence.com

Commit ae24f2b6f828 ("MAINTAINERS: add myself as maintainer of Cadence I3C
master controller driver") slips in some formatting with spaces instead of
tabs, which ./scripts/checkpatch.pl -f MAINTAINERS complains about:

  #7838: FILE: MAINTAINERS:7838:
  M:      Przemysław Gaj <pgaj@cadence.com>

  WARNING: MAINTAINERS entries use one tab after TYPE:
  #7839: FILE: MAINTAINERS:7839:
  S:      Maintained

  WARNING: MAINTAINERS entries use one tab after TYPE:
  #7840: FILE: MAINTAINERS:7840:
  F:      Documentation/devicetree/bindings/i3c/cdns,i3c-master.txt

  WARNING: MAINTAINERS entries use one tab after TYPE:
  #7841: FILE: MAINTAINERS:7841:
  F:      drivers/i3c/master/i3c-master-cdns.c

Fixes: ae24f2b6f828 ("MAINTAINERS: add myself as maintainer of Cadence I3C master controller driver")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on current master (eea2d5da29e3) and next-20191207

 MAINTAINERS | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0fd82e674cf4..59d4cb7b2981 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7835,10 +7835,10 @@ F:	Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.txt
 F:	drivers/i3c/master/dw*
 
 I3C DRIVER FOR CADENCE I3C MASTER IP
-M:      Przemysław Gaj <pgaj@cadence.com>
-S:      Maintained
-F:      Documentation/devicetree/bindings/i3c/cdns,i3c-master.txt
-F:      drivers/i3c/master/i3c-master-cdns.c
+M:	Przemysław Gaj <pgaj@cadence.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/i3c/cdns,i3c-master.txt
+F:	drivers/i3c/master/i3c-master-cdns.c
 
 IA64 (Itanium) PLATFORM
 M:	Tony Luck <tony.luck@intel.com>
-- 
2.17.1
