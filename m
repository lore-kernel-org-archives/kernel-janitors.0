From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Wed, 04 Mar 2020 10:47:17 +0000
Subject: [PATCH] MAINTAINERS: adjust to 6lowpan doc ReST conversion
Message-Id: <20200304104717.5841-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marcel Holtmann <marcel@holtmann.org>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-doc@vger.kernel.org, Stefan Schmidt <stefan@datenfreihafen.org>, linux-bluetooth@vger.kernel.org, Alexander Aring <alex.aring@gmail.com>, Jukka Rissanen <jukka.rissanen@linux.intel.com>, linux-wpan@vger.kernel.org, linux-fsdevel@vger.kernel.org, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

Commit 107db7ec7838 ("docs: networking: convert 6lowpan.txt to ReST")
renamed 6lowpan.txt to 6lowpan.rst for the ReST conversion.

Since then, ./scripts/get_maintainer.pl --self-test complains:

  warning: no file matches F: Documentation/networking/6lowpan.txt

Adjust 6LOWPAN GENERIC (BTLE/IEEE 802.15.4) entry in MAINTAINERS.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Mauro, please ack.
Marcel, please pick for bluetooth-next.

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e19b275f2ac2..d064049aad1b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -176,7 +176,7 @@ L:	linux-wpan@vger.kernel.org
 S:	Maintained
 F:	net/6lowpan/
 F:	include/net/6lowpan.h
-F:	Documentation/networking/6lowpan.txt
+F:	Documentation/networking/6lowpan.rst
 
 6PACK NETWORK DRIVER FOR AX.25
 M:	Andreas Koensgen <ajk@comnets.uni-bremen.de>
-- 
2.17.1
