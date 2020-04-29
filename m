From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Wed, 29 Apr 2020 04:21:16 +0000
Subject: [PATCH RESEND] MAINTAINERS: remove entry after hp100 driver removal
Message-Id: <20200429042116.29126-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devel@driverdev.osuosl.org, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

Commit a10079c66290 ("staging: remove hp100 driver") removed all files
from ./drivers/staging/hp/, but missed to adjust MAINTAINERS.

Since then, ./scripts/get_maintainer.pl --self-test=patterns complains:

  warning: no file matches F: drivers/staging/hp/hp100.*

So, drop HP100 Driver entry in MAINTAINERS now.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Greg, here is a minor non-urgent patch for staging.

applies cleanly on v5.7-rc3, current master and next-20200428

 MAINTAINERS | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 26f281d9f32a..41e2b577488f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7746,11 +7746,6 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Orphan
 F:	drivers/platform/x86/tc1100-wmi.c
 
-HP100:	Driver for HP 10/100 Mbit/s Voice Grade Network Adapter Series
-M:	Jaroslav Kysela <perex@perex.cz>
-S:	Obsolete
-F:	drivers/staging/hp/hp100.*
-
 HPET:	High Precision Event Timers driver
 M:	Clemens Ladisch <clemens@ladisch.de>
 S:	Maintained
-- 
2.17.1
