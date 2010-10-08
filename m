From: Tracey Dent <tdent48227@gmail.com>
Date: Fri, 08 Oct 2010 00:01:30 +0000
Subject: [PATCH 10/33] Staging: et131x: Makefile: replace the use of <module>-objs with <module>-y
Message-Id: <1286496113-11897-10-git-send-email-tdent48227@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1286496113-11897-1-git-send-email-tdent48227@gmail.com>
In-Reply-To: <1286496113-11897-1-git-send-email-tdent48227@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: greg@kroah.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, sam@ravnborg.org, linux-kbuild@vger.kernel.org, Tracey Dent <tdent48227@gmail.com>

Changed <module>-objs to <module>-y in Makefile.

Signed-off-by: Tracey Dent <tdent48227@gmail.com>
---
 drivers/staging/et131x/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/et131x/Makefile b/drivers/staging/et131x/Makefile
index 95c645d..dfcd2bf 100644
--- a/drivers/staging/et131x/Makefile
+++ b/drivers/staging/et131x/Makefile
@@ -4,7 +4,7 @@
 
 obj-$(CONFIG_ET131X) += et131x.o
 
-et131x-objs :=	et1310_eeprom.o \
+et131x-y :=	et1310_eeprom.o \
 		et1310_mac.o \
 		et1310_phy.o \
 		et1310_pm.o \
-- 
1.7.3.1.50.g1e633

