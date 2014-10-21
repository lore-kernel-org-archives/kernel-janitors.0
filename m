From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 21 Oct 2014 14:22:49 +0000
Subject: [patch] fs/file.c: silence a static checker warning
Message-Id: <20141021142249.GA29255@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

This doesn't matter because all the callers verify "nr" before calling
but really "nr" should be unsigned.  Otherwise, if we could get a
negative here then it would be able to go around our tests.

   193          /* Do we need to expand? */
   194          if (nr < fdt->max_fds)
                    ^^^^^^^^^^^^^^^^^
For this test "nr" is type promoted to a high positive so we continue.

   195                  return 0;
   196
   197          /* Can we expand? */
   198          if (nr >= sysctl_nr_open)
                    ^^^^^^^^^^^^^^^^^^^^
For this test it's treated as a negative so it's less than the max.

   199                  return -EMFILE;
   200

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/file.c b/fs/file.c
index ee738ea..029b19b 100644
--- a/fs/file.c
+++ b/fs/file.c
@@ -184,7 +184,7 @@ static int expand_fdtable(struct files_struct *files, int nr)
  * expanded and execution may have blocked.
  * The files->file_lock should be held on entry, and will be held on exit.
  */
-static int expand_files(struct files_struct *files, int nr)
+static int expand_files(struct files_struct *files, unsigned int nr)
 {
 	struct fdtable *fdt;
 
