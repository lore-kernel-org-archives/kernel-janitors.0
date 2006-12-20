From: Thomas Hisch <t.hisch@gmail.com>
Date: Wed, 20 Dec 2006 18:25:03 +0000
Subject: [KJ] [PATCH] Fixed a typing error in a sentence in fuse.txt
Message-Id: <20061220182503.GB5696@unknown-00-0d-60-79-ca-00.lan>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

removed a needless "is" in fuse.txt

Signed-off-by: Thomas Hisch <t.hisch@gmail.com>
---
 Documentation/filesystems/fuse.txt |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/fuse.txt b/Documentation/filesystems/fuse.txt
index 345392c..397a41a 100644
--- a/Documentation/filesystems/fuse.txt
+++ b/Documentation/filesystems/fuse.txt
@@ -94,8 +94,8 @@ Mount options
   filesystem is free to implement it's access policy or leave it to
   the underlying file access mechanism (e.g. in case of network
   filesystems).  This option enables permission checking, restricting
-  access based on file mode.  This is option is usually useful
-  together with the 'allow_other' mount option.
+  access based on file mode.  It is usually useful together with the
+  'allow_other' mount option.
 
 'allow_other'
 
-- 
1.4.4.2
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
