From: Jeff Layton <jlayton@redhat.com>
Date: Fri, 12 Oct 2012 13:14:22 +0000
Subject: Re: [vfs:for-next 15/22] include/linux/audit.h:668:41: warning: 'struct filename' declared inside pa
Message-Id: <20121012091422.2b2a3dd2@tlielax.poochiereds.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121011140510.GE6588@localhost>
In-Reply-To: <20121011140510.GE6588@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 12 Oct 2012 20:57:15 +0800
Yuanhan Liu <yuanhan.liu@intel.com> wrote:

> Hi Jeff,
> 
> FYI, there are new compile warnings show up in
> 
> commit: d232461f5a154db69330c602fc2fba0ed5fe42df vfs: define struct filename and have getname() return it
> config: x86_64-randconfig-s030 (attached as .config)
> 
> All warnings:
> 
> In file included from arch/x86/include/asm/syscall.h:16:0,
>                  from arch/x86/kernel/signal.c:40:
> include/linux/audit.h:668:41: warning: 'struct filename' declared inside parameter list [enabled by default]
> include/linux/audit.h:668:41: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
> include/linux/audit.h:670:41: warning: 'struct filename' declared inside parameter list [enabled by default]
> 
> vim +668 include/linux/audit.h
> 
> 9321d526 Kees Cook   2012-10-04  652  static inline int audit_alloc(struct task_struct *task)
> 9321d526 Kees Cook   2012-10-04  653  {
> 9321d526 Kees Cook   2012-10-04  654  	return 0;
> 9321d526 Kees Cook   2012-10-04  655  }
> 9321d526 Kees Cook   2012-10-04  656  static inline void audit_free(struct task_struct *task)
> 9321d526 Kees Cook   2012-10-04  657  { }
> 9321d526 Kees Cook   2012-10-04  658  static inline void audit_syscall_entry(int arch, int major, unsigned long a0,
> 9321d526 Kees Cook   2012-10-04  659  				       unsigned long a1, unsigned long a2,
> 9321d526 Kees Cook   2012-10-04  660  				       unsigned long a3)
> 9321d526 Kees Cook   2012-10-04  661  { }
> 9321d526 Kees Cook   2012-10-04  662  static inline void audit_syscall_exit(void *pt_regs)
> 9321d526 Kees Cook   2012-10-04  663  { }
> 9321d526 Kees Cook   2012-10-04  664  static inline int audit_dummy_context(void)
> 9321d526 Kees Cook   2012-10-04  665  {
> 9321d526 Kees Cook   2012-10-04  666  	return 1;
> 9321d526 Kees Cook   2012-10-04  667  }
> d232461f Jeff Layton 2012-10-10 @668  static inline void audit_getname(struct filename *name)
> 9321d526 Kees Cook   2012-10-04  669  { }
> d232461f Jeff Layton 2012-10-10  670  static inline void audit_putname(struct filename *name)
> 9321d526 Kees Cook   2012-10-04  671  { }
> 7208e09c Jeff Layton 2012-10-10  672  static inline void __audit_inode(const char *name, const struct dentry *dentry,
> 7208e09c Jeff Layton 2012-10-10  673  					unsigned int parent)
> 9321d526 Kees Cook   2012-10-04  674  { }
> b590a056 Jeff Layton 2012-10-10  675  static inline void __audit_inode_child(const struct inode *parent,
> 213a18d9 Jeff Layton 2012-10-10  676  					const struct dentry *dentry,
> 
> ---
> 0-DAY kernel build testing backend         Open Source Technology Center
> Fengguang Wu, Yuanhan Liu                              Intel Corporation


Thanks,

I think this patch should fix it. Al, look ok?


------------------[snip]--------------------

audit: move struct filename declaration outside of ifdef in audit.h

Now that the !CONFIG_AUDITSYSCALL stubs are static inlines instead of
macros, we need this declared whether syscall auditing is enabled or
not.

Signed-off-by: Jeff Layton <jlayton@redhat.com>
---
 include/linux/audit.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/audit.h b/include/linux/audit.h
index c495ffe..e5884f9 100644
--- a/include/linux/audit.h
+++ b/include/linux/audit.h
@@ -460,9 +460,9 @@ extern int audit_classify_arch(int arch);
 #define	AUDIT_TYPE_CHILD_DELETE 3	/* a child being deleted */
 #define	AUDIT_TYPE_CHILD_CREATE 4	/* a child being created */
 
-#ifdef CONFIG_AUDITSYSCALL
 struct filename;
 
+#ifdef CONFIG_AUDITSYSCALL
 /* These are defined in auditsc.c */
 				/* Public API */
 extern int  audit_alloc(struct task_struct *task);
-- 
1.7.11.7

