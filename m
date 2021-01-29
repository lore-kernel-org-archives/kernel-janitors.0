From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Fri, 29 Jan 2021 05:28:29 +0000
Subject: [PATCH] MAINTAINERS: adjust to gdth scsi driver removal
Message-Id: <20210129052829.13642-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hannes Reinecke <hare@suse.de>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org
Cc: Joe Perches <joe@perches.com>, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Pia Eichinger <pia.eichinger@st.oth-regensburg.de>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

Commit 0653c358d2dc ("scsi: Drop gdth driver") misses to adjust MAINTAINERS.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:

  warning: no file matches F:    drivers/scsi/gdt*

Remove the GDT SCSI DISK ARRAY CONTROLLER DRIVER section as well, as the
driver is removed now.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on next-20210128

Hannes, Martin, please pick this minor fix-up on your scsi-next tree.

 MAINTAINERS | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index dfb1f1af32bb..5e1fec71f21b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7363,13 +7363,6 @@ M:	Kieran Bingham <kbingham@kernel.org>
 S:	Supported
 F:	scripts/gdb/
 
-GDT SCSI DISK ARRAY CONTROLLER DRIVER
-M:	Achim Leubner <achim_leubner@adaptec.com>
-L:	linux-scsi@vger.kernel.org
-S:	Supported
-W:	http://www.icp-vortex.com/
-F:	drivers/scsi/gdt*
-
 GEMTEK FM RADIO RECEIVER DRIVER
 M:	Hans Verkuil <hverkuil@xs4all.nl>
 L:	linux-media@vger.kernel.org
-- 
2.17.1
