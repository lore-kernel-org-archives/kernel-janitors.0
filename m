From: Tracey Dent <tdent48227@gmail.com>
Date: Fri, 08 Oct 2010 00:01:37 +0000
Subject: [PATCH 17/33] Staging: octeon: Makefile: replace the use of <module>-objs with <module>-y
Message-Id: <1286496113-11897-17-git-send-email-tdent48227@gmail.com>
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
 drivers/staging/octeon/Makefile |   20 ++++++++++----------
 1 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/octeon/Makefile b/drivers/staging/octeon/Makefile
index 87447c1..fc850ba 100644
--- a/drivers/staging/octeon/Makefile
+++ b/drivers/staging/octeon/Makefile
@@ -11,16 +11,16 @@
 
 obj-${CONFIG_OCTEON_ETHERNET} :=  octeon-ethernet.o
 
-octeon-ethernet-objs := ethernet.o
-octeon-ethernet-objs += ethernet-mdio.o
-octeon-ethernet-objs += ethernet-mem.o
-octeon-ethernet-objs += ethernet-rgmii.o
-octeon-ethernet-objs += ethernet-rx.o
-octeon-ethernet-objs += ethernet-sgmii.o
-octeon-ethernet-objs += ethernet-spi.o
-octeon-ethernet-objs += ethernet-tx.o
-octeon-ethernet-objs += ethernet-xaui.o
-octeon-ethernet-objs += cvmx-pko.o cvmx-spi.o cvmx-cmd-queue.o \
+octeon-ethernet-y := ethernet.o
+octeon-ethernet-y += ethernet-mdio.o
+octeon-ethernet-y += ethernet-mem.o
+octeon-ethernet-y += ethernet-rgmii.o
+octeon-ethernet-y += ethernet-rx.o
+octeon-ethernet-y += ethernet-sgmii.o
+octeon-ethernet-y += ethernet-spi.o
+octeon-ethernet-y += ethernet-tx.o
+octeon-ethernet-y += ethernet-xaui.o
+octeon-ethernet-y += cvmx-pko.o cvmx-spi.o cvmx-cmd-queue.o \
 	cvmx-helper-board.o cvmx-helper.o cvmx-helper-xaui.o \
 	cvmx-helper-rgmii.o cvmx-helper-sgmii.o cvmx-helper-npi.o \
 	cvmx-helper-loop.o cvmx-helper-spi.o cvmx-helper-util.o \
-- 
1.7.3.1.50.g1e633

