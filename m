From: Ira Snyder <kernel@irasnyder.com>
Date: Mon, 20 Nov 2006 00:42:07 +0000
Subject: [KJ] [PATCH] sparse fix: add lock annotations to nfs client code
Message-Id: <20061119164207.7b65914a.kernel@irasnyder.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[PATCH] sparse fix: add lock annotations to nfs client code

Fixes 'context imbalance' warnings emitted by sparse while compiling.

Signed-off-by: Ira W. Snyder <kernel@irasnyder.com>

PS - This is my first patch, so I'd like some comments. Questions I have:
1) Should I CC trivial@kernel.org, the LKML itself, or any others?
2) Any problems with the format? I used cg-mkpatch to do it, only edited to add this PS section.

---
commit 59da2d61a2661d99f66085b0d8a7025affbf0a26
tree a25dd0e128fbd8016ac8f9d386064431f3b854cc
parent e030f8294a5b9f8179dae10cdbf9dcf32aa64110
author Ira W. Snyder <kernel@irasnyder.com> Sun, 19 Nov 2006 15:30:38 -0800
committer Ira W. Snyder <kernel@irasnyder.com> Sun, 19 Nov 2006 15:30:38 -0800

 fs/nfs/client.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/fs/nfs/client.c b/fs/nfs/client.c
index 5fea638..ae2018b 100644
--- a/fs/nfs/client.c
+++ b/fs/nfs/client.c
@@ -1223,6 +1223,7 @@ static int nfs_server_list_open(struct i
  * set up the iterator to start reading from the server list and return the first item
  */
 static void *nfs_server_list_start(struct seq_file *m, loff_t *_pos)
+__acquires(nfs_client_lock)
 {
 	struct list_head *_p;
 	loff_t pos = *_pos;
@@ -1262,6 +1263,7 @@ static void *nfs_server_list_next(struct
  * clean up after reading from the transports list
  */
 static void nfs_server_list_stop(struct seq_file *p, void *v)
+__releases(nfs_client_lock)
 {
 	spin_unlock(&nfs_client_lock);
 }
@@ -1314,6 +1316,7 @@ static int nfs_volume_list_open(struct i
  * set up the iterator to start reading from the volume list and return the first item
  */
 static void *nfs_volume_list_start(struct seq_file *m, loff_t *_pos)
+__acquires(nfs_client_lock)
 {
 	struct list_head *_p;
 	loff_t pos = *_pos;
@@ -1353,6 +1356,7 @@ static void *nfs_volume_list_next(struct
  * clean up after reading from the transports list
  */
 static void nfs_volume_list_stop(struct seq_file *p, void *v)
+__releases(nfs_client_lock)
 {
 	spin_unlock(&nfs_client_lock);
 }
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
