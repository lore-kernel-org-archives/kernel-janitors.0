From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Fri, 08 Jan 2021 07:39:32 +0000
Subject: [PATCH for can-next] MAINTAINERS: adjust entry to tcan4x5x file split
Message-Id: <20210108073932.20804-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marc Kleine-Budde <mkl@pengutronix.de>, linux-can@vger.kernel.org
Cc: Dan Murphy <dmurphy@ti.com>, Sean Nyekjaer <sean@geanix.com>, Sriram Dash <sriram.dash@samsung.com>, Joe Perches <joe@perches.com>, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Pia Eichinger <pia.eichinger@st.oth-regensburg.de>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

Commit 7813887ea972 ("can: tcan4x5x: rename tcan4x5x.c -> tcan4x5x-core.c")
and commit 67def4ef8bb9 ("can: tcan4x5x: move regmap code into seperate
file") split the file tcan4x5x.c into two files, but missed to adjust the
TI TCAN4X5X DEVICE DRIVER section in MAINTAINERS.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:

  warning: no file matches    F:    drivers/net/can/m_can/tcan4x5x.c

Adjust the file entry in MAINTAINERS to the tcan4x5x file splitting.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on next-20210107, not for current master

Marc, please pick this for your -next tree on top of the tcan4x5x cleanup.

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8170b40d6236..0d75f07fc951 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17887,7 +17887,7 @@ M:	Dan Murphy <dmurphy@ti.com>
 L:	linux-can@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/net/can/tcan4x5x.txt
-F:	drivers/net/can/m_can/tcan4x5x.c
+F:	drivers/net/can/m_can/tcan4x5x*
 
 TI TRF7970A NFC DRIVER
 M:	Mark Greer <mgreer@animalcreek.com>
-- 
2.17.1
