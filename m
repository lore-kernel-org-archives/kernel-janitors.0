From: Colin King <colin.king@canonical.com>
Date: Wed, 16 Dec 2020 11:19:45 +0000
Subject: [PATCH] nfsd: fix spelling mistake in Kconfig "accesible" -> "accessible"
Message-Id: <20201216111945.11014-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "J . Bruce Fields" <bfields@fieldses.org>, Chuck Lever <chuck.lever@oracle.com>, linux-nfs@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are a few spelling mistakes in the Kconfig help text. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/nfsd/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/nfsd/Kconfig b/fs/nfsd/Kconfig
index dbbc583d6273..1d70a23fc002 100644
--- a/fs/nfsd/Kconfig
+++ b/fs/nfsd/Kconfig
@@ -97,7 +97,7 @@ config NFSD_BLOCKLAYOUT
 	help
 	  This option enables support for the exporting pNFS block layouts
 	  in the kernel's NFS server. The pNFS block layout enables NFS
-	  clients to directly perform I/O to block devices accesible to both
+	  clients to directly perform I/O to block devices accessible to both
 	  the server and the clients.  See RFC 5663 for more details.
 
 	  If unsure, say N.
@@ -111,7 +111,7 @@ config NFSD_SCSILAYOUT
 	help
 	  This option enables support for the exporting pNFS SCSI layouts
 	  in the kernel's NFS server. The pNFS SCSI layout enables NFS
-	  clients to directly perform I/O to SCSI devices accesible to both
+	  clients to directly perform I/O to SCSI devices accessible to both
 	  the server and the clients.  See draft-ietf-nfsv4-scsi-layout for
 	  more details.
 
@@ -125,7 +125,7 @@ config NFSD_FLEXFILELAYOUT
 	  This option enables support for the exporting pNFS Flex File
 	  layouts in the kernel's NFS server. The pNFS Flex File  layout
 	  enables NFS clients to directly perform I/O to NFSv3 devices
-	  accesible to both the server and the clients.  See
+	  accessible to both the server and the clients.  See
 	  draft-ietf-nfsv4-flex-files for more details.
 
 	  Warning, this server implements the bare minimum functionality
-- 
2.29.2
