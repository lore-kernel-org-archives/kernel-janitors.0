From: Tracey Dent <tdent48227@gmail.com>
Date: Fri, 08 Oct 2010 00:01:39 +0000
Subject: [PATCH 19/33] Staging: rt2870: Makefile: replace the use of <module>-objs with <module>-y
Message-Id: <1286496113-11897-19-git-send-email-tdent48227@gmail.com>
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
 drivers/staging/rt2870/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/rt2870/Makefile b/drivers/staging/rt2870/Makefile
index 7b29493..b499910 100644
--- a/drivers/staging/rt2870/Makefile
+++ b/drivers/staging/rt2870/Makefile
@@ -7,7 +7,7 @@ ccflags-y += -DRTMP_MAC_USB -DRTMP_USB_SUPPORT -DRT2870 -DRTMP_TIMER_TASK_SUPPOR
 ccflags-y += -DRTMP_RF_RW_SUPPORT -DRTMP_EFUSE_SUPPORT -DRT30xx -DRT3070
 ccflags-y += -DDBG
 
-rt2870sta-objs :=		\
+rt2870sta-y :=		\
 	common/crypt_md5.o	\
 	common/crypt_sha2.o	\
 	common/crypt_hmac.o	\
-- 
1.7.3.1.50.g1e633

