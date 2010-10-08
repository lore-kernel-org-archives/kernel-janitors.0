From: Tracey Dent <tdent48227@gmail.com>
Date: Fri, 08 Oct 2010 00:01:31 +0000
Subject: [PATCH 11/33] Staging: ft1000:ft1000-pcmia:  Makefile: replace the use of <module>-objs with <module
Message-Id: <1286496113-11897-11-git-send-email-tdent48227@gmail.com>
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
 drivers/staging/ft1000/ft1000-pcmcia/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/ft1000/ft1000-pcmcia/Makefile b/drivers/staging/ft1000/ft1000-pcmcia/Makefile
index 30ad208..660b7a5 100644
--- a/drivers/staging/ft1000/ft1000-pcmcia/Makefile
+++ b/drivers/staging/ft1000/ft1000-pcmcia/Makefile
@@ -1,3 +1,3 @@
 obj-$(CONFIG_FT1000_PCMCIA) = ft1000_pcmcia.o
-ft1000_pcmcia-objs := ft1000_hw.o ft1000_dnld.o ft1000_proc.o ft1000_cs.o
+ft1000_pcmcia-y := ft1000_hw.o ft1000_dnld.o ft1000_proc.o ft1000_cs.o
 
-- 
1.7.3.1.50.g1e633

