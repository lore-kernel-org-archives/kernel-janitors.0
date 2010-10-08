From: Tracey Dent <tdent48227@gmail.com>
Date: Fri, 08 Oct 2010 00:01:22 +0000
Subject: [PATCH 02/33] Staging: batman-adv: Makefile: replace the use of <module>-objs with <module>-y
Message-Id: <1286496113-11897-2-git-send-email-tdent48227@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1286496113-11897-1-git-send-email-tdent48227@gmail.com>
In-Reply-To: <1286496113-11897-1-git-send-email-tdent48227@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: greg@kroah.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, sam@ravnborg.org, linux-kbuild@vger.kernel.org, Tracey Dent <tdent48227@gmail.com>

Changed <module>-objs to <module>-y n Makefile.

Signed-off-by: Tracey Dent <tdent48227@gmail.com>
---
 drivers/staging/batman-adv/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/batman-adv/Makefile b/drivers/staging/batman-adv/Makefile
index 4b5c434..7892428 100644
--- a/drivers/staging/batman-adv/Makefile
+++ b/drivers/staging/batman-adv/Makefile
@@ -19,4 +19,4 @@
 #
 
 obj-$(CONFIG_BATMAN_ADV) += batman-adv.o
-batman-adv-objs := main.o bat_debugfs.o bat_sysfs.o send.o routing.o soft-interface.o icmp_socket.o translation-table.o bitarray.o hash.o ring_buffer.o vis.o hard-interface.o aggregation.o originator.o unicast.o
+batman-adv-y := main.o bat_debugfs.o bat_sysfs.o send.o routing.o soft-interface.o icmp_socket.o translation-table.o bitarray.o hash.o ring_buffer.o vis.o hard-interface.o aggregation.o originator.o unicast.o
-- 
1.7.3.1.50.g1e633

