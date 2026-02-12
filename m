Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690A735B624
	for <kernel-janitors@vger.kernel.org>; Thu, 12 Feb 2026 16:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770914038; cv=none; b=NUnv909Qz8LBTKkJlgvASuKY/1/Vo4uuNA422Ca2fYOyP6CjWIa2nnQK6SqdeQCnuH0qtOXN/SFt97lOnc31zc0S5HMjwVgvvwydbDLQd3mE0kxPz61DTyTTS/EsiR4cWI+DhfUPvGfcOTVDMlV6Xgmzve2fR28fWNcXgCxJk5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770914038; c=relaxed/simple;
	bh=/y2aNF1KH9RqqxwVR1L/iLIWr21tQoqS9iX5afcu0QU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=SPjT/ZSdKxzm3FAzxrpVI+Kta/UhFsXug9RdJD/05yQgjFxO8YnmT/jjmnd25aDh5Cua9+3/z+Xr55fONEkHbvcvymmvEjPeom7zGjLMdVrPOyc4icESef6HMYSC7YQNEQOLf0nvjrYMqeKqykLvaxIwuWA/8tOPIUuXQ7+tKxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gEsYRlNK; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gEsYRlNK"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c54f700b5b1so4132226a12.0
        for <kernel-janitors@vger.kernel.org>; Thu, 12 Feb 2026 08:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770914035; x=1771518835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YINDdEn++H2VorP6YtJvLKNT5P0lhbX9RqO9SmKJgLI=;
        b=gEsYRlNKI4CpaGZcXHbb51Fae2KFp7BV4k61ELM/XgnD9PmEIVMGg6ICjSpqtSQJ00
         RGlOLMg8CGLfbqQzFCygNW+V6izK2sx01aPo9TObBW3nIx3FQjnlt50JqtNxZdU2YNAl
         A9cs7nZLRLNRNEH9p5ROiaT079ri8xIy+dy1VJG174CM+VzHCPm4GFHanQj5DHN9qe78
         mO7BPagMUyfAGznYN4lNpLaiq/VWIcEUb43wuSDcvuCSOMeatQKsSy72kbZ97oH/HiuX
         tFIp4TsaLE4n9vNauicG3ZMVsPJdGMOHqxQIfaM/NTOmOUGOn2XYR3Xt1t4XUVo9T5OG
         FRvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770914035; x=1771518835;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YINDdEn++H2VorP6YtJvLKNT5P0lhbX9RqO9SmKJgLI=;
        b=FrfiJVh95LISlkY32ysZrvcd9Pn+UdVd6TkIBAG+hv9t3m83XslZEiJ0Hi10Q2wfcV
         S7yDkht/FDivh9FZbJF2PHqOXHz2d2Ad4A17a9CawsvL23yowm5bCP5pXxtoaeQ+i6Pr
         uw1eVds2vCSxFtcpsR3zCInXyiDK0Rki15abUSfRuwG+qBN8U3NDID1wJZSEihhHy1MJ
         k3DibgWppXhDMUREKk9sedAlUtnzKJCLTsC+wR7vBYg3yesaNtZWCDO8OoOaqxlOHmID
         W8uwU07goyp2aWfBrkkkbR+itdkVeR6mIYFuCw6HfXX1Gp4ZOf9+oVqeu1fjAg2OJuAo
         FIFg==
X-Forwarded-Encrypted: i=1; AJvYcCXHv060sHPYZxBYRY2xi8vTB4t1sQ3zI45MzP8Fz7sDDwGK7QjR4pX/5akVTOwLPhmCDYrPmpMz3vcuk0FtS4A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVqzwtfJlWJuSYdi170Jkd8UuWF5Tw1nNImtXwuY9Xxjm5eUPE
	ZCkmVzbR95axsPPfH4PGSrX29QWMaXpPDvG2HCdnfnfkkr9Ut+GOCd9u
X-Gm-Gg: AZuq6aI5U3nv2rO+tVjGwAz/LCjHMI8g+64lotIniuThOpVFJUi/2b45qp5Rpyb+Y07
	wGryI+4YCGD0hnPeLk+ATVb6LRnKTPVeOYpXfUmsxvZE7M0QFJxHDWejdOwU/3jTIDih7aHRmsH
	01lGFe3YVToJRV6gAqJGysrH2n/7wjxkQWaEhWZqwkMnL4JUI4OzkBRFwIqnR1L++if2utDjfr1
	MReOYr8pVahuRzNOiv3vqU4vmePWn5IltfbJeIJ+NRb7Pnk+LFQhmEYx2ZBKooKW4MyKzGT1mSU
	hiKvH0BZCGo3yLIQa80yvX3K/enZA/MlZMT1T6xAOwv1DMQWyAQ4l2X5Bvj/jJuwNrz3qUjFNXC
	WHSiNdE1bbr1g+ZM8AMYLzQLNABorEJQe3aDveOh6QtIQHM0zAjwRYHiE0NVQSNi6IH7mkBBMmU
	iEh/fV9P2T0A9KK79YAYiPgSAViFVwFn/nX3daoFpwFN4uf0mErHCNV5Cy0D9qxuKGb6Fzfqkrp
	w==
X-Received: by 2002:a17:90a:e7d2:b0:356:2c7b:c013 with SMTP id 98e67ed59e1d1-3568f521af0mr2836501a91.29.1770914035379;
        Thu, 12 Feb 2026 08:33:55 -0800 (PST)
Received: from sean-All-Series.. (59-115-196-175.dynamic-ip.hinet.net. [59.115.196.175])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35662f6bbe9sm9718609a91.12.2026.02.12.08.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 08:33:54 -0800 (PST)
From: Sean Chang <seanwascoding@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	kernel-janitors@vger.kernel.org,
	seanwascoding@gmail.com
Subject: [PATCH v3] riscv: fix various typos in comments and code
Date: Fri, 13 Feb 2026 00:33:25 +0800
Message-Id: <20260212163325.60389-1-seanwascoding@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix various typos in RISC-V architecture code and comments.
The following changes are included:

- arch/riscv/errata/thead/errata.c: "futher" → "further"
- arch/riscv/include/asm/atomic.h: "therefor" → "therefore", "arithmatic" → "arithmetic"
- arch/riscv/include/asm/elf.h: "availiable" → "available", "coorespends" → "corresponds"
- arch/riscv/include/asm/processor.h: "requries" → "is required"
- arch/riscv/include/asm/thread_info.h: "returing" → "returning"
- arch/riscv/kernel/acpi.c: "compliancy" → "compliance"
- arch/riscv/kernel/ftrace.c: "therefor" → "therefore"
- arch/riscv/kernel/head.S: "intruction" → "instruction"
- arch/riscv/kernel/mcount-dyn.S: "localtion → "location"
- arch/riscv/kernel/module-sections.c: "maxinum" → "maximum"
- arch/riscv/kernel/probes/kprobes.c: "reenabled" → "re-enabled"
- arch/riscv/kernel/probes/uprobes.c: "probbed" → "probed"
- arch/riscv/kernel/soc.c: "extremly" → "extremely"
- arch/riscv/kernel/suspend.c: "incosistent" → "inconsistent"
- arch/riscv/kvm/tlb.c: "cahce" → "cache"
- arch/riscv/kvm/vcpu_pmu.c: "indicies" → "indices"
- arch/riscv/lib/csum.c: "implmentations" → "implementations"
- arch/riscv/lib/memmove.S: "ammount" → "amount"
- arch/riscv/mm/cacheflush.c: "visable" → "visible"
- arch/riscv/mm/physaddr.c: "aginst" → "against"

Signed-off-by: Sean Chang <seanwascoding@gmail.com>
---
v3:
  - Restore the clean subject line.
  - Fix the CC list to include the Conor.
  - Collect all typos into one clean commit.
  - Corrected some wording in the commit message.

v2:
  - Fix the "coorespends" to "corresponds"
  - Replace the "requries" to "is required"

 arch/riscv/errata/thead/errata.c     | 2 +-
 arch/riscv/include/asm/atomic.h      | 4 ++--
 arch/riscv/include/asm/elf.h         | 4 ++--
 arch/riscv/include/asm/processor.h   | 2 +-
 arch/riscv/include/asm/thread_info.h | 2 +-
 arch/riscv/kernel/acpi.c             | 2 +-
 arch/riscv/kernel/ftrace.c           | 2 +-
 arch/riscv/kernel/head.S             | 2 +-
 arch/riscv/kernel/mcount-dyn.S       | 2 +-
 arch/riscv/kernel/module-sections.c  | 2 +-
 arch/riscv/kernel/probes/kprobes.c   | 2 +-
 arch/riscv/kernel/probes/uprobes.c   | 2 +-
 arch/riscv/kernel/soc.c              | 2 +-
 arch/riscv/kernel/suspend.c          | 2 +-
 arch/riscv/kvm/tlb.c                 | 2 +-
 arch/riscv/kvm/vcpu_pmu.c            | 2 +-
 arch/riscv/lib/csum.c                | 2 +-
 arch/riscv/lib/memmove.S             | 4 ++--
 arch/riscv/mm/cacheflush.c           | 2 +-
 arch/riscv/mm/physaddr.c             | 4 ++--
 20 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
index 0b942183f708..6f1c683f0ec0 100644
--- a/arch/riscv/errata/thead/errata.c
+++ b/arch/riscv/errata/thead/errata.c
@@ -153,7 +153,7 @@ static bool errata_probe_ghostwrite(unsigned int stage,
 	 * target-c9xx cores report arch_id and impid as 0
 	 *
 	 * While ghostwrite may not affect all c9xx cores that implement
-	 * xtheadvector, there is no futher granularity than c9xx. Assume
+	 * xtheadvector, there is no further granularity than c9xx. Assume
 	 * vulnerable for this entire class of processors when xtheadvector is
 	 * enabled.
 	 */
diff --git a/arch/riscv/include/asm/atomic.h b/arch/riscv/include/asm/atomic.h
index 3f33dc54f94b..616b8b332ac5 100644
--- a/arch/riscv/include/asm/atomic.h
+++ b/arch/riscv/include/asm/atomic.h
@@ -46,7 +46,7 @@ static __always_inline void arch_atomic64_set(atomic64_t *v, s64 i)
 #endif
 
 /*
- * First, the atomic ops that have no ordering constraints and therefor don't
+ * First, the atomic ops that have no ordering constraints and therefore don't
  * have the AQ or RL bits set.  These don't return anything, so there's only
  * one version to worry about.
  */
@@ -81,7 +81,7 @@ ATOMIC_OPS(xor, xor,  i)
 
 /*
  * Atomic ops that have ordered, relaxed, acquire, and release variants.
- * There's two flavors of these: the arithmatic ops have both fetch and return
+ * There's two flavors of these: the arithmetic ops have both fetch and return
  * versions, while the logical ops only have fetch versions.
  */
 #define ATOMIC_FETCH_OP(op, asm_op, I, asm_type, c_type, prefix)	\
diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
index c7aea7886d22..aa4961b0e208 100644
--- a/arch/riscv/include/asm/elf.h
+++ b/arch/riscv/include/asm/elf.h
@@ -59,8 +59,8 @@ extern bool compat_elf_check_arch(Elf32_Ehdr *hdr);
 #endif
 
 /*
- * Provides information on the availiable set of ISA extensions to userspace,
- * via a bitmap that coorespends to each single-letter ISA extension.  This is
+ * Provides information on the available set of ISA extensions to userspace,
+ * via a bitmap that corresponds to each single-letter ISA extension.  This is
  * essentially defunct, but will remain for compatibility with userspace.
  */
 #define ELF_HWCAP	riscv_get_elf_hwcap()
diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index da5426122d28..8be97a4f1780 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -85,7 +85,7 @@ struct pt_regs;
  *    preempt_v. All preempt_v context should be dropped in such case because
  *    V-regs are caller-saved. Only sstatus.VS=ON is persisted across a
  *    schedule() call.
- *  - bit 30: The in-kernel preempt_v context is saved, and requries to be
+ *  - bit 30: The in-kernel preempt_v context is saved, and is required to be
  *    restored when returning to the context that owns the preempt_v.
  *  - bit 31: The in-kernel preempt_v context is dirty, as signaled by the
  *    trap entry code. Any context switches out-of current task need to save
diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index 836d80dd2921..e5cc6c0db710 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -117,7 +117,7 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src);
 #include <asm-generic/thread_info_tif.h>
 
 #define TIF_32BIT			16	/* compat-mode 32bit process */
-#define TIF_RISCV_V_DEFER_RESTORE	17	/* restore Vector before returing to user */
+#define TIF_RISCV_V_DEFER_RESTORE	17	/* restore Vector before returning to user */
 
 #define _TIF_RISCV_V_DEFER_RESTORE	BIT(TIF_RISCV_V_DEFER_RESTORE)
 
diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
index 71698ee11621..26c018ebce03 100644
--- a/arch/riscv/kernel/acpi.c
+++ b/arch/riscv/kernel/acpi.c
@@ -69,7 +69,7 @@ static int __init acpi_fadt_sanity_check(void)
 
 	/*
 	 * FADT is required on riscv; retrieve it to check its presence
-	 * and carry out revision and ACPI HW reduced compliancy tests
+	 * and carry out revision and ACPI HW reduced compliance tests
 	 */
 	status = acpi_get_table(ACPI_SIG_FADT, 0, &table);
 	if (ACPI_FAILURE(status)) {
diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
index 8d18d6727f0f..b430edfb83f4 100644
--- a/arch/riscv/kernel/ftrace.c
+++ b/arch/riscv/kernel/ftrace.c
@@ -148,7 +148,7 @@ int ftrace_make_nop(struct module *mod, struct dyn_ftrace *rec, unsigned long ad
 
 /*
  * This is called early on, and isn't wrapped by
- * ftrace_arch_code_modify_{prepare,post_process}() and therefor doesn't hold
+ * ftrace_arch_code_modify_{prepare,post_process}() and therefore doesn't hold
  * text_mutex, which triggers a lockdep failure.  SMP isn't running so we could
  * just directly poke the text, but it's simpler to just take the lock
  * ourselves.
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index bdf3352acf4c..d7debc6a5e70 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -80,7 +80,7 @@ relocate_enable_mmu:
 	sub a1, a1, a2
 	add ra, ra, a1
 
-	/* Point stvec to virtual address of intruction after satp write */
+	/* Point stvec to virtual address of instruction after satp write */
 	la a2, 1f
 	add a2, a2, a1
 	csrw CSR_TVEC, a2
diff --git a/arch/riscv/kernel/mcount-dyn.S b/arch/riscv/kernel/mcount-dyn.S
index 48f6c4f7dca0..082fe0b0e3c0 100644
--- a/arch/riscv/kernel/mcount-dyn.S
+++ b/arch/riscv/kernel/mcount-dyn.S
@@ -66,7 +66,7 @@
 * 8(sp) stores the function return address (i.e. parent IP) that
 * can be accessed by &(fregs)->ra in tracing function.
 *
-* The other regs are saved at the respective localtion and accessed
+* The other regs are saved at the respective location and accessed
 * by the respective ftrace_regs member.
 *
 * Here is the layout of stack for your reference.
diff --git a/arch/riscv/kernel/module-sections.c b/arch/riscv/kernel/module-sections.c
index 1675cbad8619..98eaac6f6606 100644
--- a/arch/riscv/kernel/module-sections.c
+++ b/arch/riscv/kernel/module-sections.c
@@ -148,7 +148,7 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
 		return -ENOEXEC;
 	}
 
-	/* Calculate the maxinum number of entries */
+	/* Calculate the maximum number of entries */
 	for (i = 0; i < ehdr->e_shnum; i++) {
 		size_t num_relas = sechdrs[i].sh_size / sizeof(Elf_Rela);
 		Elf_Rela *relas = (void *)ehdr + sechdrs[i].sh_offset;
diff --git a/arch/riscv/kernel/probes/kprobes.c b/arch/riscv/kernel/probes/kprobes.c
index 8723390c7cad..9e2afabf94e8 100644
--- a/arch/riscv/kernel/probes/kprobes.c
+++ b/arch/riscv/kernel/probes/kprobes.c
@@ -149,7 +149,7 @@ static void __kprobes set_current_kprobe(struct kprobe *p)
 
 /*
  * Interrupts need to be disabled before single-step mode is set, and not
- * reenabled until after single-step mode ends.
+ * re-enabled until after single-step mode ends.
  * Without disabling interrupt on local CPU, there is a chance of
  * interrupt occurrence in the period of exception return and  start of
  * out-of-line single-step, that result in wrongly single stepping
diff --git a/arch/riscv/kernel/probes/uprobes.c b/arch/riscv/kernel/probes/uprobes.c
index f0d0691a8688..eb177d0ce8ab 100644
--- a/arch/riscv/kernel/probes/uprobes.c
+++ b/arch/riscv/kernel/probes/uprobes.c
@@ -111,7 +111,7 @@ void arch_uprobe_abort_xol(struct arch_uprobe *auprobe, struct pt_regs *regs)
 
 	current->thread.bad_cause = utask->autask.saved_cause;
 	/*
-	 * Task has received a fatal signal, so reset back to probbed
+	 * Task has received a fatal signal, so reset back to probed
 	 * address.
 	 */
 	instruction_pointer_set(regs, utask->vaddr);
diff --git a/arch/riscv/kernel/soc.c b/arch/riscv/kernel/soc.c
index a0516172a33c..7d69e3b6bab4 100644
--- a/arch/riscv/kernel/soc.c
+++ b/arch/riscv/kernel/soc.c
@@ -8,7 +8,7 @@
 #include <asm/soc.h>
 
 /*
- * This is called extremly early, before parse_dtb(), to allow initializing
+ * This is called extremely early, before parse_dtb(), to allow initializing
  * SoC hardware before memory or any device driver initialization.
  */
 void __init soc_early_init(void)
diff --git a/arch/riscv/kernel/suspend.c b/arch/riscv/kernel/suspend.c
index aff93090c4ef..3efbf7874f3b 100644
--- a/arch/riscv/kernel/suspend.c
+++ b/arch/riscv/kernel/suspend.c
@@ -78,7 +78,7 @@ int cpu_suspend(unsigned long arg,
 	suspend_save_csrs(&context);
 
 	/*
-	 * Function graph tracer state gets incosistent when the kernel
+	 * Function graph tracer state gets inconsistent when the kernel
 	 * calls functions that never return (aka finishers) hence disable
 	 * graph tracing during their execution.
 	 */
diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
index ff1aeac4eb8e..e44f3ebe3844 100644
--- a/arch/riscv/kvm/tlb.c
+++ b/arch/riscv/kvm/tlb.c
@@ -182,7 +182,7 @@ void kvm_riscv_local_tlb_sanitize(struct kvm_vcpu *vcpu)
 
 	/*
 	 * Flush VS-stage TLB entries for implementation where VS-stage
-	 * TLB does not cahce guest physical address and VMID.
+	 * TLB does not cache guest physical address and VMID.
 	 */
 	if (static_branch_unlikely(&kvm_riscv_vsstage_tlb_no_gpa))
 		kvm_riscv_local_hfence_vvma_all(vmid);
diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index a2fae70ee174..ebff438a725f 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -671,7 +671,7 @@ int kvm_riscv_vcpu_pmu_ctr_stop(struct kvm_vcpu *vcpu, unsigned long ctr_base,
 				pmc->counter_val += perf_event_read_value(pmc->perf_event,
 									  &enabled, &running);
 			/*
-			 * The counter and overflow indicies in the snapshot region are w.r.to
+			 * The counter and overflow indices in the snapshot region are w.r.to
 			 * cbase. Modify the set bit in the counter mask instead of the pmc_index
 			 * which indicates the absolute counter index.
 			 */
diff --git a/arch/riscv/lib/csum.c b/arch/riscv/lib/csum.c
index 75bd0abffd63..5d4379768e5d 100644
--- a/arch/riscv/lib/csum.c
+++ b/arch/riscv/lib/csum.c
@@ -269,7 +269,7 @@ unsigned int do_csum(const unsigned char *buff, int len)
 	 * on machines with fast misaligned accesses.
 	 *
 	 * There is some duplicate code between the "with_alignment" and
-	 * "no_alignment" implmentations, but the overlap is too awkward to be
+	 * "no_alignment" implementations, but the overlap is too awkward to be
 	 * able to fit in one function without introducing multiple static
 	 * branches. The largest chunk of overlap was delegated into the
 	 * do_csum_common function.
diff --git a/arch/riscv/lib/memmove.S b/arch/riscv/lib/memmove.S
index cb3e2e7ef0ba..410e598d4677 100644
--- a/arch/riscv/lib/memmove.S
+++ b/arch/riscv/lib/memmove.S
@@ -40,8 +40,8 @@ SYM_FUNC_START(__memmove)
 	 *   Both Copy Modes: t1 - Temporary for load-store
 	 *   Both Copy Modes: t2 - Temporary for load-store
 	 *   Both Copy Modes: a5 - dest to src alignment offset
-	 *   Both Copy Modes: a6 - Shift ammount
-	 *   Both Copy Modes: a7 - Inverse Shift ammount
+	 *   Both Copy Modes: a6 - Shift amount
+	 *   Both Copy Modes: a7 - Inverse Shift amount
 	 *   Both Copy Modes: a2 - Alternate breakpoint for unrolled loops
 	 */
 
diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index d83a612464f6..f8ead7cb7c7d 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -29,7 +29,7 @@ void flush_icache_all(void)
 	 * Make sure all previous writes to the D$ are ordered before making
 	 * the IPI. The RISC-V spec states that a hart must execute a data fence
 	 * before triggering a remote fence.i in order to make the modification
-	 * visable for remote harts.
+	 * visible for remote harts.
 	 *
 	 * IPIs on RISC-V are triggered by MMIO writes to either CLINT or
 	 * S-IMSIC, so the fence ensures previous data writes "happen before"
diff --git a/arch/riscv/mm/physaddr.c b/arch/riscv/mm/physaddr.c
index 559d291fac5c..b1836e9481ce 100644
--- a/arch/riscv/mm/physaddr.c
+++ b/arch/riscv/mm/physaddr.c
@@ -9,7 +9,7 @@
 phys_addr_t __virt_to_phys(unsigned long x)
 {
 	/*
-	 * Boundary checking aginst the kernel linear mapping space.
+	 * Boundary checking against the kernel linear mapping space.
 	 */
 	WARN(!is_linear_mapping(x) && !is_kernel_mapping(x),
 	     "virt_to_phys used for non-linear address: %p (%pS)\n",
@@ -25,7 +25,7 @@ phys_addr_t __phys_addr_symbol(unsigned long x)
 	unsigned long kernel_end = kernel_start + kernel_map.size;
 
 	/*
-	 * Boundary checking aginst the kernel image mapping.
+	 * Boundary checking against the kernel image mapping.
 	 * __pa_symbol should only be used on kernel symbol addresses.
 	 */
 	VIRTUAL_BUG_ON(x < kernel_start || x > kernel_end);
-- 
2.34.1

