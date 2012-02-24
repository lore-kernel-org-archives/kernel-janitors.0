From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 24 Feb 2012 11:31:58 +0000
Subject: [patch] epoll: remove unneeded variable in reverse_path_check()
Message-Id: <20120224113158.GA17641@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jason Baron <jbaron@redhat.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We never use the length variable.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/eventpoll.c b/fs/eventpoll.c
index c636fc8..997a6d2 100644
--- a/fs/eventpoll.c
+++ b/fs/eventpoll.c
@@ -1042,13 +1042,11 @@ static int reverse_path_check_proc(void *priv, void *cookie, int call_nests)
  */
 static int reverse_path_check(void)
 {
-	int length = 0;
 	int error = 0;
 	struct file *current_file;
 
 	/* let's call this for all tfiles */
 	list_for_each_entry(current_file, &tfile_check_list, f_tfile_llink) {
-		length++;
 		path_count_init();
 		error = ep_call_nested(&poll_loop_ncalls, EP_MAX_NESTS,
 					reverse_path_check_proc, current_file,
