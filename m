From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Thu, 16 Jan 2020 18:58:44 +0000
Subject: [PATCH RESEND] MAINTAINERS: fix style in SAFESETID SECURITY MODULE
Message-Id: <20200116185844.11201-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200116184836.10256-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20200116184836.10256-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Micah Morton <mortonm@chromium.org>
Cc: Joe Perches <joe@perches.com>, linux-security-module@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

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
applies cleanly on v5.5-rc6 and next-20200116
Micah, please pick this patch.

 MAINTAINERS | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a66cb722c675..d2aa9db61ab6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14415,10 +14415,10 @@ F:	drivers/media/pci/saa7146/
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
