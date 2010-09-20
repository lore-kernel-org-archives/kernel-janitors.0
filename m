From: matt mooney <mfm@muteddisk.com>
Date: Mon, 20 Sep 2010 06:33:32 +0000
Subject: [PATCH] Documentation/kbuild: correct variable definitions in makefiles.txt
Message-Id: <1284964412-32211-1-git-send-email-mfm@muteddisk.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michal Marek <mmarek@suse.cz>, Randy Dunlap <rdunlap@xenotime.net>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org

Change $(src) and $(obj) definitions to state the path as absolute and
not relative.

Signed-off-by: matt mooney <mfm@muteddisk.com>
---

Hmm, this file is also _full_ of bad grammar and might be out of date FAIK.
If you would like it updated/corrected, please let me know. I don't mind doing
this, but only if it is beneficial and wanted.

 Documentation/kbuild/makefiles.txt |   11 +++++------
 1 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/Documentation/kbuild/makefiles.txt b/Documentation/kbuild/makefiles.txt
index c787ae5..fe162f5 100644
--- a/Documentation/kbuild/makefiles.txt
+++ b/Documentation/kbuild/makefiles.txt
@@ -376,14 +376,13 @@ more details, with real examples.
 	Two variables are used when defining special rules:
 
     $(src)
-	$(src) is a relative path which points to the directory
-	where the Makefile is located. Always use $(src) when
-	referring to files located in the src tree.
+	The absolute path to the directory where the makefile is
+	located. Always use $(src) when referring to files located
+	in the src directory.
 
     $(obj)
-	$(obj) is a relative path which points to the directory
-	where the target is saved. Always use $(obj) when
-	referring to generated files.
+	The absolute path to the directory where the target is saved.
+	Always use $(obj) when referring to generated files.
 
 	Example:
 		#drivers/scsi/Makefile
-- 
1.7.2.1

