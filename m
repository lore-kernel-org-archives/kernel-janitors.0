From: Dan Carpenter <error27@gmail.com>
Date: Mon, 07 Jun 2010 21:05:54 +0000
Subject: [patch 3/7] selinux: fix error codes in cond_read_av_list()
Message-Id: <20100607210554.GS5483@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

After this patch cond_read_av_list() no longer returns -1 for any
errors.  It just propagates error code back from lower levels.  Those can
either be -EINVAL or -ENOMEM.

I also modified cond_insertf() since cond_read_av_list() passes that as a 
function pointer to avtab_read_item().  It isn't used anywhere else.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/security/selinux/ss/conditional.c b/security/selinux/ss/conditional.c
index acaa6cd..4c39f19 100644
--- a/security/selinux/ss/conditional.c
+++ b/security/selinux/ss/conditional.c
@@ -263,7 +263,7 @@ static int cond_insertf(struct avtab *a, struct avtab_key *k, struct avtab_datum
 	struct cond_av_list *other = data->other, *list, *cur;
 	struct avtab_node *node_ptr;
 	u8 found;
-
+	int ret = -EINVAL;
 
 	/*
 	 * For type rules we have to make certain there aren't any
@@ -317,8 +317,10 @@ static int cond_insertf(struct avtab *a, struct avtab_key *k, struct avtab_datum
 	}
 
 	list = kzalloc(sizeof(struct cond_av_list), GFP_KERNEL);
-	if (!list)
+	if (!list) {
+		ret = -ENOMEM;
 		goto err;
+	}
 
 	list->node = node_ptr;
 	if (!data->head)
@@ -331,7 +333,7 @@ static int cond_insertf(struct avtab *a, struct avtab_key *k, struct avtab_datum
 err:
 	cond_av_list_destroy(data->head);
 	data->head = NULL;
-	return -1;
+	return ret;
 }
 
 static int cond_read_av_list(struct policydb *p, void *fp, struct cond_av_list **ret_list, struct cond_av_list *other)
@@ -346,7 +348,7 @@ static int cond_read_av_list(struct policydb *p, void *fp, struct cond_av_list *
 	len = 0;
 	rc = next_entry(buf, fp, sizeof(u32));
 	if (rc < 0)
-		return -1;
+		return rc;
 
 	len = le32_to_cpu(buf[0]);
 	if (len = 0)
@@ -361,7 +363,6 @@ static int cond_read_av_list(struct policydb *p, void *fp, struct cond_av_list *
 				     &data);
 		if (rc)
 			return rc;
-
 	}
 
 	*ret_list = data.head;
