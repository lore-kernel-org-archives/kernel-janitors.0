From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 12 Apr 2015 20:55:02 +0000
Subject: [PATCH] staging: lustre: llite: drop uses of OBD free functions
Message-Id: <1428872102-10108-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <oleg.drokin@intel.com>
Cc: kernel-janitors@vger.kernel.org, Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, HPDD-discuss@ml01.01.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Replace OBD_FREE and OBD_FREE_PTR by kfree.

The semantic patch that makes these changes is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression ptr, size;
@@

- OBD_FREE(ptr, size);
+ kfree(ptr);

@@
expression ptr;
@@

- OBD_FREE_PTR(ptr);
+ kfree(ptr);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---

The corresponding ALLOC functions were already replaced by kalloc in this
code.

 drivers/staging/lustre/lustre/llite/dcache.c       |    6 +--
 drivers/staging/lustre/lustre/llite/dir.c          |   34 +++++++++----------
 drivers/staging/lustre/lustre/llite/file.c         |   36 ++++++++++-----------
 drivers/staging/lustre/lustre/llite/llite_close.c  |    6 +--
 drivers/staging/lustre/lustre/llite/llite_lib.c    |   31 ++++++++----------
 drivers/staging/lustre/lustre/llite/llite_nfs.c    |    2 -
 drivers/staging/lustre/lustre/llite/llite_rmtacl.c |    4 +-
 drivers/staging/lustre/lustre/llite/lloop.c        |    8 ++--
 drivers/staging/lustre/lustre/llite/namei.c        |    2 -
 drivers/staging/lustre/lustre/llite/statahead.c    |   20 +++++------
 drivers/staging/lustre/lustre/llite/xattr_cache.c  |    6 +--
 11 files changed, 77 insertions(+), 78 deletions(-)

diff --git a/drivers/staging/lustre/lustre/llite/dcache.c b/drivers/staging/lustre/lustre/llite/dcache.c
index fe1fd05..87b6a80 100644
--- a/drivers/staging/lustre/lustre/llite/dcache.c
+++ b/drivers/staging/lustre/lustre/llite/dcache.c
@@ -52,7 +52,7 @@ static void free_dentry_data(struct rcu_head *head)
 	struct ll_dentry_data *lld;
 
 	lld = container_of(head, struct ll_dentry_data, lld_rcu_head);
-	OBD_FREE_PTR(lld);
+	kfree(lld);
 }
 
 /* should NOT be called with the dcache lock, see fs/dcache.c */
@@ -67,7 +67,7 @@ static void ll_release(struct dentry *de)
 
 	if (lld->lld_it) {
 		ll_intent_release(lld->lld_it);
-		OBD_FREE(lld->lld_it, sizeof(*lld->lld_it));
+		kfree(lld->lld_it);
 	}
 
 	de->d_fsdata = NULL;
@@ -194,7 +194,7 @@ int ll_d_init(struct dentry *de)
 				de->d_fsdata = lld;
 				__d_lustre_invalidate(de);
 			} else {
-				OBD_FREE_PTR(lld);
+				kfree(lld);
 			}
 			spin_unlock(&de->d_lock);
 		} else {
diff --git a/drivers/staging/lustre/lustre/llite/dir.c b/drivers/staging/lustre/lustre/llite/dir.c
index a5bc694..0f5d57c 100644
--- a/drivers/staging/lustre/lustre/llite/dir.c
+++ b/drivers/staging/lustre/lustre/llite/dir.c
@@ -239,7 +239,7 @@ static int ll_dir_filler(void *_hash, struct page *page0)
 	ll_pagevec_lru_add_file(&lru_pvec);
 
 	if (page_pool != &page0)
-		OBD_FREE(page_pool, sizeof(struct page *) * max_pages);
+		kfree(page_pool);
 	return rc;
 }
 
@@ -650,7 +650,7 @@ static int ll_send_mgc_param(struct obd_export *mgc, char *string)
 				sizeof(struct mgs_send_param), msp, NULL);
 	if (rc)
 		CERROR("Failed to set parameter: %d\n", rc);
-	OBD_FREE_PTR(msp);
+	kfree(msp);
 
 	return rc;
 }
@@ -787,7 +787,7 @@ int ll_dir_setstripe(struct inode *inode, struct lov_user_md *lump,
 
 end:
 		if (param != NULL)
-			OBD_FREE(param, MGS_PARAM_MAXLEN);
+			kfree(param);
 	}
 	return rc;
 }
@@ -1072,7 +1072,7 @@ static int copy_and_ioctl(int cmd, struct obd_export *exp,
 
 	rc = obd_iocontrol(cmd, exp, size, copy, NULL);
 out:
-	OBD_FREE(copy, size);
+	kfree(copy);
 
 	return rc;
 }
@@ -1163,7 +1163,7 @@ static int quotactl_ioctl(struct ll_sb_info *sbi, struct if_quotactl *qctl)
 				oqctl->qc_cmd = Q_QUOTAOFF;
 				obd_quotactl(sbi->ll_md_exp, oqctl);
 			}
-			OBD_FREE_PTR(oqctl);
+			kfree(oqctl);
 			return rc;
 		}
 		/* If QIF_SPACE is not set, client should collect the
@@ -1206,11 +1206,11 @@ static int quotactl_ioctl(struct ll_sb_info *sbi, struct if_quotactl *qctl)
 				oqctl->qc_dqblk.dqb_valid &= ~QIF_SPACE;
 			}
 
-			OBD_FREE_PTR(oqctl_tmp);
+			kfree(oqctl_tmp);
 		}
 out:
 		QCTL_COPY(qctl, oqctl);
-		OBD_FREE_PTR(oqctl);
+		kfree(oqctl);
 	}
 
 	return rc;
@@ -1437,7 +1437,7 @@ lmv_out_free:
 		}
 free_lmv:
 		if (tmp)
-			OBD_FREE(tmp, lum_size);
+			kfree(tmp);
 		return rc;
 	}
 	case LL_IOC_REMOVE_ENTRY: {
@@ -1657,7 +1657,7 @@ free_lmm:
 		if (rc < 0)
 			CDEBUG(D_INFO, "obd_quotacheck failed: rc %d\n", rc);
 
-		OBD_FREE_PTR(oqctl);
+		kfree(oqctl);
 		return error ?: rc;
 	}
 	case OBD_IOC_POLL_QUOTACHECK: {
@@ -1691,7 +1691,7 @@ free_lmm:
 			goto out_poll;
 		}
 out_poll:
-		OBD_FREE_PTR(check);
+		kfree(check);
 		return rc;
 	}
 	case LL_IOC_QUOTACTL: {
@@ -1712,7 +1712,7 @@ out_poll:
 			rc = -EFAULT;
 
 out_quotactl:
-		OBD_FREE_PTR(qctl);
+		kfree(qctl);
 		return rc;
 	}
 	case OBD_IOC_GETDTNAME:
@@ -1781,13 +1781,13 @@ out_quotactl:
 
 		/* We don't know the true size yet; copy the fixed-size part */
 		if (copy_from_user(hur, (void *)arg, sizeof(*hur))) {
-			OBD_FREE_PTR(hur);
+			kfree(hur);
 			return -EFAULT;
 		}
 
 		/* Compute the whole struct size */
 		totalsize = hur_len(hur);
-		OBD_FREE_PTR(hur);
+		kfree(hur);
 		if (totalsize < 0)
 			return -E2BIG;
 
@@ -1865,7 +1865,7 @@ out_quotactl:
 		if (!copy)
 			return -ENOMEM;
 		if (copy_from_user(copy, (char *)arg, sizeof(*copy))) {
-			OBD_FREE_PTR(copy);
+			kfree(copy);
 			return -EFAULT;
 		}
 
@@ -1873,7 +1873,7 @@ out_quotactl:
 		if (copy_to_user((char *)arg, copy, sizeof(*copy)))
 			rc = -EFAULT;
 
-		OBD_FREE_PTR(copy);
+		kfree(copy);
 		return rc;
 	}
 	case LL_IOC_HSM_COPY_END: {
@@ -1884,7 +1884,7 @@ out_quotactl:
 		if (!copy)
 			return -ENOMEM;
 		if (copy_from_user(copy, (char *)arg, sizeof(*copy))) {
-			OBD_FREE_PTR(copy);
+			kfree(copy);
 			return -EFAULT;
 		}
 
@@ -1892,7 +1892,7 @@ out_quotactl:
 		if (copy_to_user((char *)arg, copy, sizeof(*copy)))
 			rc = -EFAULT;
 
-		OBD_FREE_PTR(copy);
+		kfree(copy);
 		return rc;
 	}
 	default:
diff --git a/drivers/staging/lustre/lustre/llite/file.c b/drivers/staging/lustre/lustre/llite/file.c
index 85e74d1..b53e4c7 100644
--- a/drivers/staging/lustre/lustre/llite/file.c
+++ b/drivers/staging/lustre/lustre/llite/file.c
@@ -213,7 +213,7 @@ out:
 		md_clear_open_replay_data(md_exp, och);
 		/* Free @och if it is not waiting for DONE_WRITING. */
 		och->och_fh.cookie = DEAD_HANDLE_MAGIC;
-		OBD_FREE_PTR(och);
+		kfree(och);
 	}
 	if (req) /* This is close request */
 		ptlrpc_req_finished(req);
@@ -693,7 +693,7 @@ restart:
 out_och_free:
 	if (rc) {
 		if (och_p && *och_p) {
-			OBD_FREE(*och_p, sizeof(struct obd_client_handle));
+			kfree(*och_p);
 			*och_p = NULL; /* OBD_FREE writes some magic there */
 			(*och_usecount)--;
 		}
@@ -875,7 +875,7 @@ out_close:
 out_release_it:
 	ll_intent_release(&it);
 out:
-	OBD_FREE_PTR(och);
+	kfree(och);
 	return ERR_PTR(rc);
 }
 
@@ -1779,7 +1779,7 @@ int ll_fid2path(struct inode *inode, void __user *arg)
 		rc = -EFAULT;
 
 gf_free:
-	OBD_FREE(gfout, outsize);
+	kfree(gfout);
 	return rc;
 }
 
@@ -1883,7 +1883,7 @@ int ll_data_version(struct inode *inode, __u64 *data_version,
 			*data_version = obdo->o_data_version;
 	}
 
-	OBD_FREE_PTR(obdo);
+	kfree(obdo);
 out:
 	ccc_inode_lsm_put(inode, lsm);
 	return rc;
@@ -2110,7 +2110,7 @@ putgl:
 
 free:
 	if (llss != NULL)
-		OBD_FREE_PTR(llss);
+		kfree(llss);
 
 	return rc;
 }
@@ -2195,10 +2195,10 @@ static int ll_hsm_import(struct inode *inode, struct file *file,
 
 out:
 	if (hss != NULL)
-		OBD_FREE_PTR(hss);
+		kfree(hss);
 
 	if (attr != NULL)
-		OBD_FREE_PTR(attr);
+		kfree(attr);
 
 	return rc;
 }
@@ -2350,7 +2350,7 @@ ll_file_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		op_data = ll_prep_md_op_data(NULL, inode, NULL, NULL, 0, 0,
 					     LUSTRE_OPC_ANY, hus);
 		if (IS_ERR(op_data)) {
-			OBD_FREE_PTR(hus);
+			kfree(hus);
 			return PTR_ERR(op_data);
 		}
 
@@ -2361,7 +2361,7 @@ ll_file_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 			rc = -EFAULT;
 
 		ll_finish_md_op_data(op_data);
-		OBD_FREE_PTR(hus);
+		kfree(hus);
 		return rc;
 	}
 	case LL_IOC_HSM_STATE_SET: {
@@ -2373,13 +2373,13 @@ ll_file_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 			return -ENOMEM;
 
 		if (copy_from_user(hss, (char *)arg, sizeof(*hss))) {
-			OBD_FREE_PTR(hss);
+			kfree(hss);
 			return -EFAULT;
 		}
 
 		rc = ll_hsm_state_set(inode, hss);
 
-		OBD_FREE_PTR(hss);
+		kfree(hss);
 		return rc;
 	}
 	case LL_IOC_HSM_ACTION: {
@@ -2394,7 +2394,7 @@ ll_file_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		op_data = ll_prep_md_op_data(NULL, inode, NULL, NULL, 0, 0,
 					     LUSTRE_OPC_ANY, hca);
 		if (IS_ERR(op_data)) {
-			OBD_FREE_PTR(hca);
+			kfree(hca);
 			return PTR_ERR(op_data);
 		}
 
@@ -2405,7 +2405,7 @@ ll_file_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 			rc = -EFAULT;
 
 		ll_finish_md_op_data(op_data);
-		OBD_FREE_PTR(hca);
+		kfree(hca);
 		return rc;
 	}
 	case LL_IOC_SET_LEASE: {
@@ -2500,13 +2500,13 @@ ll_file_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 			return -ENOMEM;
 
 		if (copy_from_user(hui, (void *)arg, sizeof(*hui))) {
-			OBD_FREE_PTR(hui);
+			kfree(hui);
 			return -EFAULT;
 		}
 
 		rc = ll_hsm_import(inode, file, hui);
 
-		OBD_FREE_PTR(hui);
+		kfree(hui);
 		return rc;
 	}
 	default: {
@@ -3257,7 +3257,7 @@ void ll_iocontrol_unregister(void *magic)
 			list_del(&tmp->iocd_list);
 			up_write(&llioc.ioc_sem);
 
-			OBD_FREE(tmp, size);
+			kfree(tmp);
 			return;
 		}
 	}
@@ -3625,6 +3625,6 @@ int ll_layout_restore(struct inode *inode)
 	hur->hur_request.hr_itemcount = 1;
 	rc = obd_iocontrol(LL_IOC_HSM_REQUEST, cl_i2sbi(inode)->ll_md_exp,
 			   len, hur, NULL);
-	OBD_FREE(hur, len);
+	kfree(hur);
 	return rc;
 }
diff --git a/drivers/staging/lustre/lustre/llite/llite_close.c b/drivers/staging/lustre/lustre/llite/llite_close.c
index a94ba02..7bdae72 100644
--- a/drivers/staging/lustre/lustre/llite/llite_close.c
+++ b/drivers/staging/lustre/lustre/llite/llite_close.c
@@ -305,7 +305,7 @@ out:
 	ll_finish_md_op_data(op_data);
 	if (och) {
 		md_clear_open_replay_data(ll_i2sbi(inode)->ll_md_exp, och);
-		OBD_FREE_PTR(och);
+		kfree(och);
 	}
 }
 
@@ -374,7 +374,7 @@ int ll_close_thread_start(struct ll_close_queue **lcq_ret)
 
 	task = kthread_run(ll_close_thread, lcq, "ll_close");
 	if (IS_ERR(task)) {
-		OBD_FREE(lcq, sizeof(*lcq));
+		kfree(lcq);
 		return PTR_ERR(task);
 	}
 
@@ -389,5 +389,5 @@ void ll_close_thread_shutdown(struct ll_close_queue *lcq)
 	atomic_inc(&lcq->lcq_stop);
 	wake_up(&lcq->lcq_waitq);
 	wait_for_completion(&lcq->lcq_comp);
-	OBD_FREE(lcq, sizeof(*lcq));
+	kfree(lcq);
 }
diff --git a/drivers/staging/lustre/lustre/llite/llite_lib.c b/drivers/staging/lustre/lustre/llite/llite_lib.c
index bf1ec27..c2bed83 100644
--- a/drivers/staging/lustre/lustre/llite/llite_lib.c
+++ b/drivers/staging/lustre/lustre/llite/llite_lib.c
@@ -145,7 +145,7 @@ static void ll_free_sbi(struct super_block *sb)
 		spin_lock(&ll_sb_lock);
 		list_del(&sbi->ll_list);
 		spin_unlock(&ll_sb_lock);
-		OBD_FREE(sbi, sizeof(*sbi));
+		kfree(sbi);
 	}
 }
 
@@ -177,7 +177,7 @@ static int client_common_fill_super(struct super_block *sb, char *md, char *dt,
 
 	osfs = kzalloc(sizeof(*osfs), GFP_NOFS);
 	if (!osfs) {
-		OBD_FREE_PTR(data);
+		kfree(data);
 		return -ENOMEM;
 	}
 
@@ -296,7 +296,7 @@ static int client_common_fill_super(struct super_block *sb, char *md, char *dt,
 				      valid ^ CLIENT_CONNECT_MDT_REQD, ",");
 		LCONSOLE_ERROR_MSG(0x170, "Server %s does not support feature(s) needed for correct operation of this client (%s). Please upgrade server or downgrade client.\n",
 				   sbi->ll_md_exp->exp_obd->obd_name, buf);
-		OBD_FREE(buf, PAGE_CACHE_SIZE);
+		kfree(buf);
 		err = -EPROTO;
 		goto out_md_fid;
 	}
@@ -501,7 +501,7 @@ static int client_common_fill_super(struct super_block *sb, char *md, char *dt,
 	err = md_getattr(sbi->ll_md_exp, op_data, &request);
 	if (oc)
 		capa_put(oc);
-	OBD_FREE_PTR(op_data);
+	kfree(op_data);
 	if (err) {
 		CERROR("%s: md_getattr failed for root: rc = %d\n",
 		       sbi->ll_md_exp->exp_obd->obd_name, err);
@@ -583,9 +583,9 @@ static int client_common_fill_super(struct super_block *sb, char *md, char *dt,
 	}
 
 	if (data != NULL)
-		OBD_FREE_PTR(data);
+		kfree(data);
 	if (osfs != NULL)
-		OBD_FREE_PTR(osfs);
+		kfree(osfs);
 
 	return err;
 out_root:
@@ -604,9 +604,9 @@ out_md:
 	sbi->ll_md_exp = NULL;
 out:
 	if (data != NULL)
-		OBD_FREE_PTR(data);
+		kfree(data);
 	if (osfs != NULL)
-		OBD_FREE_PTR(osfs);
+		kfree(osfs);
 	lprocfs_unregister_mountpoint(sbi);
 	return err;
 }
@@ -932,7 +932,7 @@ int ll_fill_super(struct super_block *sb, struct vfsmount *mnt)
 	lsi->lsi_llsbi = sbi = ll_init_sbi();
 	if (!sbi) {
 		module_put(THIS_MODULE);
-		OBD_FREE_PTR(cfg);
+		kfree(cfg);
 		return -ENOMEM;
 	}
 
@@ -994,15 +994,15 @@ int ll_fill_super(struct super_block *sb, struct vfsmount *mnt)
 
 out_free:
 	if (md)
-		OBD_FREE(md, strlen(lprof->lp_md) + instlen + 2);
+		kfree(md);
 	if (dt)
-		OBD_FREE(dt, strlen(lprof->lp_dt) + instlen + 2);
+		kfree(dt);
 	if (err)
 		ll_put_super(sb);
 	else if (sbi->ll_flags & LL_SBI_VERBOSE)
 		LCONSOLE_WARN("Mounted %s\n", profilenm);
 
-	OBD_FREE_PTR(cfg);
+	kfree(cfg);
 	return err;
 } /* ll_fill_super */
 
@@ -1126,8 +1126,7 @@ void ll_clear_inode(struct inode *inode)
 		ll_md_real_close(inode, FMODE_READ);
 
 	if (S_ISLNK(inode->i_mode) && lli->lli_symlink_name) {
-		OBD_FREE(lli->lli_symlink_name,
-			 strlen(lli->lli_symlink_name) + 1);
+		kfree(lli->lli_symlink_name);
 		lli->lli_symlink_name = NULL;
 	}
 
@@ -1957,7 +1956,7 @@ void ll_umount_begin(struct super_block *sb)
 		obd_iocontrol(IOC_OSC_SET_ACTIVE, sbi->ll_dt_exp,
 			      sizeof(*ioc_data), ioc_data, NULL);
 
-		OBD_FREE_PTR(ioc_data);
+		kfree(ioc_data);
 	}
 
 	/* Really, we'd like to wait until there are no requests outstanding,
@@ -2236,7 +2235,7 @@ void ll_finish_md_op_data(struct md_op_data *op_data)
 {
 	capa_put(op_data->op_capa1);
 	capa_put(op_data->op_capa2);
-	OBD_FREE_PTR(op_data);
+	kfree(op_data);
 }
 
 int ll_show_options(struct seq_file *seq, struct dentry *dentry)
diff --git a/drivers/staging/lustre/lustre/llite/llite_nfs.c b/drivers/staging/lustre/lustre/llite/llite_nfs.c
index 243a784..a4c59ef 100644
--- a/drivers/staging/lustre/lustre/llite/llite_nfs.c
+++ b/drivers/staging/lustre/lustre/llite/llite_nfs.c
@@ -116,7 +116,7 @@ struct inode *search_inode_for_lustre(struct super_block *sb,
 
 	/* mds_fid2dentry ignores f_type */
 	rc = md_getattr(sbi->ll_md_exp, op_data, &req);
-	OBD_FREE_PTR(op_data);
+	kfree(op_data);
 	if (rc) {
 		CERROR("can't get object attrs, fid "DFID", rc %d\n",
 		       PFID(fid), rc);
diff --git a/drivers/staging/lustre/lustre/llite/llite_rmtacl.c b/drivers/staging/lustre/lustre/llite/llite_rmtacl.c
index f4da156..c8a450b 100644
--- a/drivers/staging/lustre/lustre/llite/llite_rmtacl.c
+++ b/drivers/staging/lustre/lustre/llite/llite_rmtacl.c
@@ -94,7 +94,7 @@ static void rce_free(struct rmtacl_ctl_entry *rce)
 	if (!list_empty(&rce->rce_list))
 		list_del(&rce->rce_list);
 
-	OBD_FREE_PTR(rce);
+	kfree(rce);
 }
 
 static struct rmtacl_ctl_entry *__rct_search(struct rmtacl_ctl_table *rct,
@@ -205,7 +205,7 @@ void ee_free(struct eacl_entry *ee)
 	if (ee->ee_acl)
 		lustre_ext_acl_xattr_free(ee->ee_acl);
 
-	OBD_FREE_PTR(ee);
+	kfree(ee);
 }
 
 static struct eacl_entry *__et_search_del(struct eacl_table *et, pid_t key,
diff --git a/drivers/staging/lustre/lustre/llite/lloop.c b/drivers/staging/lustre/lustre/llite/lloop.c
index 413a840..cc00fd1 100644
--- a/drivers/staging/lustre/lustre/llite/lloop.c
+++ b/drivers/staging/lustre/lustre/llite/lloop.c
@@ -840,9 +840,9 @@ out_mem4:
 out_mem3:
 	while (i--)
 		put_disk(disks[i]);
-	OBD_FREE(disks, max_loop * sizeof(*disks));
+	kfree(disks);
 out_mem2:
-	OBD_FREE(loop_dev, max_loop * sizeof(*loop_dev));
+	kfree(loop_dev);
 out_mem1:
 	unregister_blkdev(lloop_major, "lloop");
 	ll_iocontrol_unregister(ll_iocontrol_magic);
@@ -863,8 +863,8 @@ static void lloop_exit(void)
 
 	unregister_blkdev(lloop_major, "lloop");
 
-	OBD_FREE(disks, max_loop * sizeof(*disks));
-	OBD_FREE(loop_dev, max_loop * sizeof(*loop_dev));
+	kfree(disks);
+	kfree(loop_dev);
 }
 
 module_init(lloop_init);
diff --git a/drivers/staging/lustre/lustre/llite/namei.c b/drivers/staging/lustre/lustre/llite/namei.c
index 49f1cb0..3724f8a 100644
--- a/drivers/staging/lustre/lustre/llite/namei.c
+++ b/drivers/staging/lustre/lustre/llite/namei.c
@@ -665,7 +665,7 @@ static int ll_atomic_open(struct inode *dir, struct dentry *dentry,
 
 out_release:
 	ll_intent_release(it);
-	OBD_FREE(it, sizeof(*it));
+	kfree(it);
 
 	return rc;
 }
diff --git a/drivers/staging/lustre/lustre/llite/statahead.c b/drivers/staging/lustre/lustre/llite/statahead.c
index b75562c..2c10ab7 100644
--- a/drivers/staging/lustre/lustre/llite/statahead.c
+++ b/drivers/staging/lustre/lustre/llite/statahead.c
@@ -312,7 +312,7 @@ static void ll_sa_entry_cleanup(struct ll_statahead_info *sai,
 		entry->se_minfo = NULL;
 		ll_intent_release(&minfo->mi_it);
 		iput(minfo->mi_dir);
-		OBD_FREE_PTR(minfo);
+		kfree(minfo);
 	}
 
 	if (req) {
@@ -336,7 +336,7 @@ static void ll_sa_entry_put(struct ll_statahead_info *sai,
 		ll_sa_entry_cleanup(sai, entry);
 		iput(entry->se_inode);
 
-		OBD_FREE(entry, entry->se_size);
+		kfree(entry);
 		atomic_dec(&sai->sai_cache_count);
 	}
 }
@@ -544,7 +544,7 @@ static void ll_sai_put(struct ll_statahead_info *sai)
 		LASSERT(agl_list_empty(sai));
 
 		iput(inode);
-		OBD_FREE_PTR(sai);
+		kfree(sai);
 	}
 }
 
@@ -772,7 +772,7 @@ out:
 	if (rc != 0) {
 		ll_intent_release(it);
 		iput(dir);
-		OBD_FREE_PTR(minfo);
+		kfree(minfo);
 	}
 	if (sai != NULL)
 		ll_sai_put(sai);
@@ -786,8 +786,8 @@ static void sa_args_fini(struct md_enqueue_info *minfo,
 	iput(minfo->mi_dir);
 	capa_put(minfo->mi_data.op_capa1);
 	capa_put(minfo->mi_data.op_capa2);
-	OBD_FREE_PTR(minfo);
-	OBD_FREE_PTR(einfo);
+	kfree(minfo);
+	kfree(einfo);
 }
 
 /**
@@ -816,15 +816,15 @@ static int sa_args_init(struct inode *dir, struct inode *child,
 
 	minfo = kzalloc(sizeof(*minfo), GFP_NOFS);
 	if (!minfo) {
-		OBD_FREE_PTR(einfo);
+		kfree(einfo);
 		return -ENOMEM;
 	}
 
 	op_data = ll_prep_md_op_data(&minfo->mi_data, dir, child, qstr->name,
 				     qstr->len, 0, LUSTRE_OPC_ANY, NULL);
 	if (IS_ERR(op_data)) {
-		OBD_FREE_PTR(einfo);
-		OBD_FREE_PTR(minfo);
+		kfree(einfo);
+		kfree(minfo);
 		return PTR_ERR(op_data);
 	}
 
@@ -1720,7 +1720,7 @@ int do_statahead_enter(struct inode *dir, struct dentry **dentryp,
 
 out:
 	if (sai != NULL)
-		OBD_FREE_PTR(sai);
+		kfree(sai);
 	spin_lock(&lli->lli_sa_lock);
 	lli->lli_opendir_key = NULL;
 	lli->lli_opendir_pid = 0;
diff --git a/drivers/staging/lustre/lustre/llite/xattr_cache.c b/drivers/staging/lustre/lustre/llite/xattr_cache.c
index 69ea92a..6956dec 100644
--- a/drivers/staging/lustre/lustre/llite/xattr_cache.c
+++ b/drivers/staging/lustre/lustre/llite/xattr_cache.c
@@ -144,7 +144,7 @@ static int ll_xattr_cache_add(struct list_head *cache,
 
 	return 0;
 err_value:
-	OBD_FREE(xattr->xe_name, xattr->xe_namelen);
+	kfree(xattr->xe_name);
 err_name:
 	OBD_SLAB_FREE_PTR(xattr, xattr_kmem);
 
@@ -170,8 +170,8 @@ static int ll_xattr_cache_del(struct list_head *cache,
 
 	if (ll_xattr_cache_find(cache, xattr_name, &xattr) = 0) {
 		list_del(&xattr->xe_list);
-		OBD_FREE(xattr->xe_name, xattr->xe_namelen);
-		OBD_FREE(xattr->xe_value, xattr->xe_vallen);
+		kfree(xattr->xe_name);
+		kfree(xattr->xe_value);
 		OBD_SLAB_FREE_PTR(xattr, xattr_kmem);
 
 		return 0;

