From: Tracey Dent <tdent48227@gmail.com>
Date: Fri, 08 Oct 2010 00:01:51 +0000
Subject: [PATCH 31/33] Staging: wlan-ng: Makefile: replace the use of <module>-objs with <module>-y
Message-Id: <1286496113-11897-31-git-send-email-tdent48227@gmail.com>
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
 drivers/staging/wlan-ng/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/wlan-ng/Makefile b/drivers/staging/wlan-ng/Makefile
index db5d597..32b69f2 100644
--- a/drivers/staging/wlan-ng/Makefile
+++ b/drivers/staging/wlan-ng/Makefile
@@ -1,6 +1,6 @@
 obj-$(CONFIG_PRISM2_USB) += prism2_usb.o
 
-prism2_usb-objs := prism2usb.o \
+prism2_usb-y := prism2usb.o \
 		p80211conv.o \
 		p80211req.o \
 		p80211wep.o \
-- 
1.7.3.1.50.g1e633

