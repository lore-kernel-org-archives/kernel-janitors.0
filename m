From: Peter Huewe <peterhuewe@gmx.de>
Date: Tue, 22 Dec 2009 09:05:58 +0000
Subject: [PATCH] MAINTAINERS: Fix entry for uwb to include subdirectories
Message-Id: <1261472760-24854-1-git-send-email-peterhuewe@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Kosina <trivial@kernel.org>
Cc: kernel-janitors@vger.kernel.org, Peter Huewe <peterhuewe@gmx.de>, Andrew Morton <akpm@linux-foundation.org>, Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org

This little patch removes the asterisk wildcard, in order to get the uwb
maintainer when using get_maintainer.pl on anyfiles in the
subdirectories of uwb.
Otherwise it get_maintainer.pl does not come up with a result

Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
---
 MAINTAINERS |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e770069..fbcc8f9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5467,7 +5467,7 @@ ULTRA-WIDEBAND (UWB) SUBSYSTEM:
 M:	David Vrabel <david.vrabel@csr.com>
 L:	linux-usb@vger.kernel.org
 S:	Supported
-F:	drivers/uwb/*
+F:	drivers/uwb/
 F:	include/linux/uwb.h
 F:	include/linux/uwb/
 
-- 
1.6.4.4

