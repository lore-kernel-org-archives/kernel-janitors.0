From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sat, 07 Dec 2019 18:27:51 +0000
Subject: [PATCH] MAINTAINERS: fix style in SAFESETID SECURITY MODULE
Message-Id: <20191207182751.14249-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Micah Morton <mortonm@chromium.org>
Cc: linux-security-module@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

Commit fc5b34a35458 ("Add entry in MAINTAINERS file for SafeSetID LSM")
slips in some formatting with spaces instead of tabs, which
./scripts/checkpatch.pl -f MAINTAINERS complains about:

  WARNING: MAINTAINERS entries use one tab after TYPE:
  #14394: FILE: MAINTAINERS:14394:
  +M:     Micah Morton <mortonm@chromium.org>

  WARNING: MAINTAINERS entries use one tab after TYPE:
  #14395: FILE: MAINTAINERS:14395:
  +S:     Supported

  WARNING: MAINTAINERS entries use one tab after TYPE:
  #14396: FILE: MAINTAINERS:14396:
  +F:     security/safesetid/

  WARNING: MAINTAINERS entries use one tab after TYPE:
  #14397: FILE: MAINTAINERS:14397:
  +F:     Documentation/admin-guide/LSM/SafeSetID.rst

Fixes: fc5b34a35458 ("Add entry in MAINTAINERS file for SafeSetID LSM")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on current master (eea2d5da29e3) and next-20191207

 MAINTAINERS | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 59d4cb7b2981..f282e5cbc40e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14391,10 +14391,10 @@ F:	drivers/media/pci/saa7146/
 F:	include/media/drv-intf/saa7146*
 
 SAFESETID SECURITY MODULE
-M:     Micah Morton <mortonm@chromium.org>
-S:     Supported
-F:     security/safesetid/
-F:     Documentation/admin-guide/LSM/SafeSetID.rst
+M:	Micah Morton <mortonm@chromium.org>
+S:	Supported
+F:	security/safesetid/
+F:	Documentation/admin-guide/LSM/SafeSetID.rst
 
 SAMSUNG AUDIO (ASoC) DRIVERS
 M:	Krzysztof Kozlowski <krzk@kernel.org>
-- 
2.17.1
