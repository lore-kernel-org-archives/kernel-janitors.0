From: Carlo Perassi <carlo@linux.it>
Date: Fri, 28 Jan 2005 14:57:20 +0000
Subject: [KJ] [PATCH] avoiding some warn_unused_result warnings
Message-Id: <20050128145720.GA21982@voyager>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="NzB8fVQJ5HfG6fxh"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patch for fs/binfmt_elf.c tries to avoid some warnings about the ignored
return value of functions like copy_to_user, that are declared with attribute
warn_unused_result.
The patched kernel was compiled without the old warnings.
Comments are welcome.

-- 
Carlo Perassi - http://www.linux.it/~carlo/

--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="binfmt_elf.patch"

Signed-off-by: Carlo Perassi <carlo@linux.it>

---

--- linux-2.6.11-rc2/fs/binfmt_elf.c	2005-01-24 11:06:50.000000000 +0100
+++ linux-2.6.11-rc2-mod/fs/binfmt_elf.c	2005-01-28 14:53:19.302689984 +0100
@@ -110,15 +110,21 @@ static int set_brk(unsigned long start, 
    be in memory */
 
 
-static void padzero(unsigned long elf_bss)
+static int padzero(unsigned long elf_bss)
 {
 	unsigned long nbyte;
 
 	nbyte = ELF_PAGEOFFSET(elf_bss);
 	if (nbyte) {
 		nbyte = ELF_MIN_ALIGN - nbyte;
-		clear_user((void __user *) elf_bss, nbyte);
+		if (clear_user((void __user *) elf_bss, nbyte))
+			return -EFAULT;
+
 	}
+	else
+		return -EFAULT;
+
+	return 0;
 }
 
 /* Let's use some macros to make this stack manipulation a litle clearer */
@@ -134,7 +140,7 @@ static void padzero(unsigned long elf_bs
 #define STACK_ALLOC(sp, len) ({ sp -= len ; sp; })
 #endif
 
-static void
+static int
 create_elf_tables(struct linux_binprm *bprm, struct elfhdr * exec,
 		int interp_aout, unsigned long load_addr,
 		unsigned long interp_load_addr)
@@ -179,7 +185,8 @@ create_elf_tables(struct linux_binprm *b
 			STACK_ALLOC(p, ((current->pid % 64) << 7));
 #endif
 		u_platform = (elf_addr_t __user *)STACK_ALLOC(p, len);
-		__copy_to_user(u_platform, k_platform, len);
+		if (__copy_to_user(u_platform, k_platform, len))
+			return -EFAULT;
 	}
 
 	/* Create the ELF interpreter info */
@@ -259,7 +266,7 @@ create_elf_tables(struct linux_binprm *b
 		__put_user((elf_addr_t)p, argv++);
 		len = strnlen_user((void __user *)p, PAGE_SIZE*MAX_ARG_PAGES);
 		if (!len || len > PAGE_SIZE*MAX_ARG_PAGES)
-			return;
+			return -EFAULT;
 		p += len;
 	}
 	__put_user(0, argv);
@@ -269,7 +276,7 @@ create_elf_tables(struct linux_binprm *b
 		__put_user((elf_addr_t)p, envp++);
 		len = strnlen_user((void __user *)p, PAGE_SIZE*MAX_ARG_PAGES);
 		if (!len || len > PAGE_SIZE*MAX_ARG_PAGES)
-			return;
+			return -EFAULT;
 		p += len;
 	}
 	__put_user(0, envp);
@@ -277,7 +284,10 @@ create_elf_tables(struct linux_binprm *b
 
 	/* Put the elf_info on the stack in the right place.  */
 	sp = (elf_addr_t __user *)envp + 1;
-	copy_to_user(sp, elf_info, ei_index * sizeof(elf_addr_t));
+	if(copy_to_user(sp, elf_info, ei_index * sizeof(elf_addr_t)))
+		return -EFAULT;
+
+	return 0;
 }
 
 #ifndef elf_map
@@ -411,7 +421,8 @@ static unsigned long load_elf_interp(str
 	 * that there are zero-mapped pages up to and including the 
 	 * last bss page.
 	 */
-	padzero(elf_bss);
+	if (padzero(elf_bss))
+		goto out;
 	elf_bss = ELF_PAGESTART(elf_bss + ELF_MIN_ALIGN - 1);	/* What we have mapped so far */
 
 	/* Map the last of the bss segment */
@@ -791,7 +802,9 @@ static int load_elf_binary(struct linux_
 				nbyte = ELF_MIN_ALIGN - nbyte;
 				if (nbyte > elf_brk - elf_bss)
 					nbyte = elf_brk - elf_bss;
-				clear_user((void __user *) elf_bss + load_bias, nbyte);
+				if (clear_user((void __user *) elf_bss + load_bias, 
+							nbyte))
+					goto out;
 			}
 		}
 
@@ -875,7 +888,8 @@ static int load_elf_binary(struct linux_
 		send_sig(SIGKILL, current, 0);
 		goto out_free_dentry;
 	}
-	padzero(elf_bss);
+	if (padzero(elf_bss))
+		goto out;
 
 	if (elf_interpreter) {
 		if (interpreter_type == INTERPRETER_AOUT)
@@ -910,8 +924,10 @@ static int load_elf_binary(struct linux_
 
 	compute_creds(bprm);
 	current->flags &= ~PF_FORKNOEXEC;
-	create_elf_tables(bprm, &loc->elf_ex, (interpreter_type == INTERPRETER_AOUT),
-			load_addr, interp_load_addr);
+	if (create_elf_tables(bprm, &loc->elf_ex, 
+				(interpreter_type == INTERPRETER_AOUT), load_addr, 
+				interp_load_addr))
+		goto out;
 	/* N.B. passed_fileno might not be initialized? */
 	if (interpreter_type == INTERPRETER_AOUT)
 		current->mm->arg_start += strlen(passed_fileno) + 1;
@@ -1039,7 +1055,8 @@ static int load_elf_library(struct file 
 		goto out_free_ph;
 
 	elf_bss = elf_phdata->p_vaddr + elf_phdata->p_filesz;
-	padzero(elf_bss);
+	if (padzero(elf_bss))
+		goto out;
 
 	len = ELF_PAGESTART(elf_phdata->p_filesz + elf_phdata->p_vaddr + ELF_MIN_ALIGN - 1);
 	bss = elf_phdata->p_memsz + elf_phdata->p_vaddr;
@@ -1246,7 +1263,7 @@ static void fill_prstatus(struct elf_prs
 	cputime_to_timeval(p->signal->cstime, &prstatus->pr_cstime);
 }
 
-static void fill_psinfo(struct elf_prpsinfo *psinfo, struct task_struct *p,
+static int fill_psinfo(struct elf_prpsinfo *psinfo, struct task_struct *p,
 			struct mm_struct *mm)
 {
 	int i, len;
@@ -1257,8 +1274,9 @@ static void fill_psinfo(struct elf_prpsi
 	len = mm->arg_end - mm->arg_start;
 	if (len >= ELF_PRARGSZ)
 		len = ELF_PRARGSZ-1;
-	copy_from_user(&psinfo->pr_psargs,
-		       (const char __user *)mm->arg_start, len);
+	if (copy_from_user(&psinfo->pr_psargs,
+		       (const char __user *)mm->arg_start, len))
+		return -EFAULT;
 	for(i = 0; i < len; i++)
 		if (psinfo->pr_psargs[i] == 0)
 			psinfo->pr_psargs[i] = ' ';
@@ -1279,7 +1297,7 @@ static void fill_psinfo(struct elf_prpsi
 	SET_GID(psinfo->pr_gid, p->gid);
 	strncpy(psinfo->pr_fname, p->comm, sizeof(psinfo->pr_fname));
 	
-	return;
+	return 0;
 }
 
 /* Here is the structure in which status of each thread is captured. */
@@ -1446,7 +1464,8 @@ static int elf_core_dump(long signr, str
 
 	fill_note(notes +0, "CORE", NT_PRSTATUS, sizeof(*prstatus), prstatus);
 	
-	fill_psinfo(psinfo, current->group_leader, current->mm);
+	if (fill_psinfo(psinfo, current->group_leader, current->mm))
+		goto cleanup; /* XXX */
 	fill_note(notes +1, "CORE", NT_PRPSINFO, sizeof(*psinfo), psinfo);
 	
 	fill_note(notes +2, "CORE", NT_TASKSTRUCT, sizeof(*current), current);

--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--NzB8fVQJ5HfG6fxh--
