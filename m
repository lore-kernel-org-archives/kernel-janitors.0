From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Tue, 02 Oct 2012 11:57:04 +0000
Subject: [PATCH RFC] MAINTAINERS: Add section for subsystem shortname
Message-Id: <1349179024-5319-1-git-send-email-peter.senna@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: joe@perches.com
Cc: gregkh@linuxfoundation.org, davem@davemloft.net, arnd@arndb.de, elezegarcia@gmail.com, dan.carpenter@oracle.com, Julia.Lawall@lip6.fr, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Peter Senna Tschudin <peter.senna@gmail.com>

The shortname for a subsystem, that is primarly used when sending patches over E-mail, is not stored anywhere in the source code. Actually one need to dig git log or mailing list archives. There is no standard, and the Maintainer choose how to short name his/her subsystem. MAINTAINERS file is the right place for storing this information.

U is the second letter of Subsystem.

This will also enable automatic tools like scripts/get_maintainer.pl to provide the correct short name for each filename in the Kernel source tree.

Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3386238..a1be2a1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -104,6 +104,11 @@ Descriptions of section entries:
 	      matches patches or files that contain one or more of the words
 	      printk, pr_info or pr_err
 	   One regex pattern per line.  Multiple K: lines acceptable.
+	U: Subsystem short name. Used in the subject of patch sent by email to
+	   identify that subsystem. Short means up to 20 chars. Examples:
+	   U:	media
+	   U:	media/em28xx
+	   U:	SCSI
 
 Note: For the hard of thinking, this list is meant to remain in alphabetical
 order. If you could add yourselves to it in alphabetical order that would be
-- 
1.7.11.4

