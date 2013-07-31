From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 31 Jul 2013 09:02:29 +0000
Subject: [patch] dlm: some checks can underflow
Message-Id: <20130731090229.GD8210@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This is a static checker fix.  We have several places here that check
the upper limit without checking for negative numbers.  One example of
this is in find_rsb().

My static checker marks endian data as user controled so.  The
"ms->m_header.h_length" variable is tagged as user data because it
starts as little endian and we convert it at the start of
dlm_receive_buffer().  That means that receive_extralen() returns
user controlled data which could be negative.  The call tree here is:

-> dlm_receive_buffer()
   -> dlm_receive_message()
      -> _receive_message()
         -> receive_request()

            We get "namelen" from receive_extralen(ms);

            -> find_rsb()

It's never perfectly clear how invasive to make a fix like this.  Many
of the changes in the patch are not needed but I wanted to make things
consistent.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Compile tested only.

diff --git a/fs/dlm/lock.h b/fs/dlm/lock.h
index 5e0c72e..22c630a 100644
--- a/fs/dlm/lock.h
+++ b/fs/dlm/lock.h
@@ -14,7 +14,7 @@
 #define __LOCK_DOT_H__
 
 void dlm_dump_rsb(struct dlm_rsb *r);
-void dlm_dump_rsb_name(struct dlm_ls *ls, char *name, int len);
+void dlm_dump_rsb_name(struct dlm_ls *ls, char *name, unsigned int len);
 void dlm_print_lkb(struct dlm_lkb *lkb);
 void dlm_receive_message_saved(struct dlm_ls *ls, struct dlm_message *ms,
 			       uint32_t saved_seq);
@@ -29,10 +29,11 @@ void dlm_unlock_recovery(struct dlm_ls *ls);
 void dlm_scan_waiters(struct dlm_ls *ls);
 void dlm_scan_timeout(struct dlm_ls *ls);
 void dlm_adjust_timeouts(struct dlm_ls *ls);
-int dlm_master_lookup(struct dlm_ls *ls, int nodeid, char *name, int len,
-		      unsigned int flags, int *r_nodeid, int *result);
+int dlm_master_lookup(struct dlm_ls *ls, int nodeid, char *name,
+		      unsigned int len, unsigned int flags, int *r_nodeid,
+		      int *result);
 
-int dlm_search_rsb_tree(struct rb_root *tree, char *name, int len,
+int dlm_search_rsb_tree(struct rb_root *tree, char *name, unsigned int len,
 			struct dlm_rsb **r_ret);
 
 void dlm_recover_purge(struct dlm_ls *ls);
diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index e223a91..15b5623 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -87,7 +87,7 @@ static int _request_lock(struct dlm_rsb *r, struct dlm_lkb *lkb);
 static int _cancel_lock(struct dlm_rsb *r, struct dlm_lkb *lkb);
 static void __receive_convert_reply(struct dlm_rsb *r, struct dlm_lkb *lkb,
 				    struct dlm_message *ms);
-static int receive_extralen(struct dlm_message *ms);
+static unsigned int receive_extralen(struct dlm_message *ms);
 static void do_purge(struct dlm_ls *ls, int nodeid, int pid);
 static void del_timeout(struct dlm_lkb *lkb);
 static void toss_rsb(struct kref *kref);
@@ -397,7 +397,7 @@ static int pre_rsb_struct(struct dlm_ls *ls)
    unlock any spinlocks, go back and call pre_rsb_struct again.
    Otherwise, take an rsb off the list and return it. */
 
-static int get_rsb_struct(struct dlm_ls *ls, char *name, int len,
+static int get_rsb_struct(struct dlm_ls *ls, char *name, unsigned int len,
 			  struct dlm_rsb **r_ret)
 {
 	struct dlm_rsb *r;
@@ -444,7 +444,7 @@ static int rsb_cmp(struct dlm_rsb *r, const char *name, int nlen)
 	return memcmp(r->res_name, maxname, DLM_RESNAME_MAXLEN);
 }
 
-int dlm_search_rsb_tree(struct rb_root *tree, char *name, int len,
+int dlm_search_rsb_tree(struct rb_root *tree, char *name, unsigned int len,
 			struct dlm_rsb **r_ret)
 {
 	struct rb_node *node = tree->rb_node;
@@ -542,7 +542,7 @@ static int rsb_insert(struct dlm_rsb *rsb, struct rb_root *tree)
  * while that rsb has a potentially stale master.)
  */
 
-static int find_rsb_dir(struct dlm_ls *ls, char *name, int len,
+static int find_rsb_dir(struct dlm_ls *ls, char *name, unsigned int len,
 			uint32_t hash, uint32_t b,
 			int dir_nodeid, int from_nodeid,
 			unsigned int flags, struct dlm_rsb **r_ret)
@@ -720,7 +720,7 @@ static int find_rsb_dir(struct dlm_ls *ls, char *name, int len,
    dlm_recover_locks) before we've made ourself master (in
    dlm_recover_masters). */
 
-static int find_rsb_nodir(struct dlm_ls *ls, char *name, int len,
+static int find_rsb_nodir(struct dlm_ls *ls, char *name, unsigned int len,
 			  uint32_t hash, uint32_t b,
 			  int dir_nodeid, int from_nodeid,
 			  unsigned int flags, struct dlm_rsb **r_ret)
@@ -814,8 +814,8 @@ static int find_rsb_nodir(struct dlm_ls *ls, char *name, int len,
 	return error;
 }
 
-static int find_rsb(struct dlm_ls *ls, char *name, int len, int from_nodeid,
-		    unsigned int flags, struct dlm_rsb **r_ret)
+static int find_rsb(struct dlm_ls *ls, char *name, unsigned int len,
+		    int from_nodeid, unsigned int flags, struct dlm_rsb **r_ret)
 {
 	uint32_t hash, b;
 	int dir_nodeid;
@@ -908,8 +908,9 @@ static int validate_master_nodeid(struct dlm_ls *ls, struct dlm_rsb *r,
  * . dlm_master_lookup RECOVER_MASTER (fix_master 1, from_master 0)
  */
 
-int dlm_master_lookup(struct dlm_ls *ls, int from_nodeid, char *name, int len,
-		      unsigned int flags, int *r_nodeid, int *result)
+int dlm_master_lookup(struct dlm_ls *ls, int from_nodeid, char *name,
+		      unsigned int len, unsigned int flags, int *r_nodeid,
+		      int *result)
 {
 	struct dlm_rsb *r = NULL;
 	uint32_t hash, b;
@@ -1099,7 +1100,7 @@ static void dlm_dump_rsb_hash(struct dlm_ls *ls, uint32_t hash)
 	}
 }
 
-void dlm_dump_rsb_name(struct dlm_ls *ls, char *name, int len)
+void dlm_dump_rsb_name(struct dlm_ls *ls, char *name, unsigned int len)
 {
 	struct dlm_rsb *r = NULL;
 	uint32_t hash, b;
@@ -1655,7 +1656,8 @@ static void shrink_bucket(struct dlm_ls *ls, int b)
 	int our_nodeid = dlm_our_nodeid();
 	int remote_count = 0;
 	int need_shrink = 0;
-	int i, len, rv;
+	unsigned int len;
+	int i, rv;
 
 	memset(&ls->ls_remove_lens, 0, sizeof(int) * DLM_REMOVE_NAMES_MAX);
 
@@ -1946,7 +1948,8 @@ void dlm_adjust_timeouts(struct dlm_ls *ls)
 
 static void set_lvb_lock(struct dlm_rsb *r, struct dlm_lkb *lkb)
 {
-	int b, len = r->res_ls->ls_lvblen;
+	unsigned int len = r->res_ls->ls_lvblen;
+	int b;
 
 	/* b=1 lvb returned to caller
 	   b=0 lvb written to rsb or invalidated
@@ -2037,7 +2040,7 @@ static void set_lvb_lock_pc(struct dlm_rsb *r, struct dlm_lkb *lkb,
 
 	b = dlm_lvb_operations[lkb->lkb_grmode + 1][lkb->lkb_rqmode + 1];
 	if (b = 1) {
-		int len = receive_extralen(ms);
+		unsigned int len = receive_extralen(ms);
 		if (len > r->res_ls->ls_lvblen)
 			len = r->res_ls->ls_lvblen;
 		memcpy(lkb->lkb_lvbptr, ms->m_extra, len);
@@ -2802,7 +2805,7 @@ static void confirm_master(struct dlm_rsb *r, int error)
 }
 
 static int set_lock_args(int mode, struct dlm_lksb *lksb, uint32_t flags,
-			 int namelen, unsigned long timeout_cs,
+			 unsigned int namelen, unsigned long timeout_cs,
 			 void (*ast) (void *astparam),
 			 void *astparam,
 			 void (*bast) (void *astparam, int mode),
@@ -3310,7 +3313,7 @@ static int _cancel_lock(struct dlm_rsb *r, struct dlm_lkb *lkb)
  */
 
 static int request_lock(struct dlm_ls *ls, struct dlm_lkb *lkb, char *name,
-			int len, struct dlm_args *args)
+			unsigned int len, struct dlm_args *args)
 {
 	struct dlm_rsb *r;
 	int error;
@@ -3877,7 +3880,7 @@ static void receive_flags_reply(struct dlm_lkb *lkb, struct dlm_message *ms)
 		         (ms->m_flags & 0x0000FFFF);
 }
 
-static int receive_extralen(struct dlm_message *ms)
+static unsigned int receive_extralen(struct dlm_message *ms)
 {
 	return (ms->m_header.h_length - sizeof(struct dlm_message));
 }
@@ -3885,7 +3888,7 @@ static int receive_extralen(struct dlm_message *ms)
 static int receive_lvb(struct dlm_ls *ls, struct dlm_lkb *lkb,
 		       struct dlm_message *ms)
 {
-	int len;
+	unsigned int len;
 
 	if (lkb->lkb_exflags & DLM_LKF_VALBLK) {
 		if (!lkb->lkb_lvbptr)
@@ -4009,7 +4012,8 @@ static int validate_message(struct dlm_lkb *lkb, struct dlm_message *ms)
 	return error;
 }
 
-static void send_repeat_remove(struct dlm_ls *ls, char *ms_name, int len)
+static void send_repeat_remove(struct dlm_ls *ls, char *ms_name,
+			       unsigned int len)
 {
 	char name[DLM_RESNAME_MAXLEN + 1];
 	struct dlm_message *ms;
@@ -4072,7 +4076,8 @@ static int receive_request(struct dlm_ls *ls, struct dlm_message *ms)
 	struct dlm_lkb *lkb;
 	struct dlm_rsb *r;
 	int from_nodeid;
-	int error, namelen = 0;
+	unsigned int namelen = 0;
+	int error;
 
 	from_nodeid = ms->m_header.h_nodeid;
 
@@ -4361,7 +4366,8 @@ static int receive_bast(struct dlm_ls *ls, struct dlm_message *ms)
 
 static void receive_lookup(struct dlm_ls *ls, struct dlm_message *ms)
 {
-	int len, error, ret_nodeid, from_nodeid, our_nodeid;
+	unsigned int len;
+	int error, ret_nodeid, from_nodeid, our_nodeid;
 
 	from_nodeid = ms->m_header.h_nodeid;
 	our_nodeid = dlm_our_nodeid();
@@ -4384,7 +4390,8 @@ static void receive_remove(struct dlm_ls *ls, struct dlm_message *ms)
 	char name[DLM_RESNAME_MAXLEN+1];
 	struct dlm_rsb *r;
 	uint32_t hash, b;
-	int rv, len, dir_nodeid, from_nodeid;
+	unsigned int len;
+	int rv, dir_nodeid, from_nodeid;
 
 	from_nodeid = ms->m_header.h_nodeid;
 
@@ -5590,8 +5597,8 @@ static int receive_rcom_lock_args(struct dlm_ls *ls, struct dlm_lkb *lkb,
 	lkb->lkb_astfn = (rl->rl_asts & DLM_CB_CAST) ? &fake_astfn : NULL;
 
 	if (lkb->lkb_exflags & DLM_LKF_VALBLK) {
-		int lvblen = rc->rc_header.h_length - sizeof(struct dlm_rcom) -
-			 sizeof(struct rcom_lock);
+		unsigned int lvblen = rc->rc_header.h_length -
+			sizeof(struct dlm_rcom) - sizeof(struct rcom_lock);
 		if (lvblen > ls->ls_lvblen)
 			return -EINVAL;
 		lkb->lkb_lvbptr = dlm_allocate_lvb(ls);
