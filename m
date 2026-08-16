Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F74C3A7D73
	for <kernel-janitors@vger.kernel.org>; Sun, 16 Aug 2026 14:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786891129; cv=none; b=erj1tLGEB98mC6QiiwjkzLCDgotNvtZfNG/6isTN59dSJKi3s2OiJL1/nx/8GKvouht5xnpsMgh3C/SYoIPy0NOiDCbexUJFyahvGhaeGhPIBrfYkAJcpSYofnAkdJB/WAQxh9zDzaXgo7sDfFzG18/U1aC8lazjjV2hxL54mE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786891129; c=relaxed/simple;
	bh=OSGF5aF4lCng+3oyBXwszL6XCTX6OlO5azK2Q+r7+rc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aTexTZI4HdkFz7bOcoCwxGZeNYWpaFTB7RWXkP4j47Av4vfWRBTZZMnWKnX7STT3ZQsFIELFVyzte1uBwhSX+t9qemwwDrPPrXLvgX1yI1UrC2yMGPsMC6QwVneOLdS3DL6q/MhVmhAPy1UhY6ILRetuh7UQFlcpdM0c1m0WjK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nzHNBH+A; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nzHNBH+A"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-495757ccbc1so22927025e9.2
        for <kernel-janitors@vger.kernel.org>; Sun, 16 Aug 2026 07:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786891126; x=1787495926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=slKPyCDrN2MNA+O23XO0ScfIg+YQ5ZR+PoLwJeEJvyE=;
        b=nzHNBH+Aua6mL48yxg1hBsv34JEJXS7C87HO/GNe3bGlU7SUg8FjwEOBITq6eMRT3J
         Ss+B6kq/1iqIwWlU+KUqBwuawpzoMQC82nS6laf+8LHescmimHIr2mXiZGUVlGCNOjig
         0fHv6oGyvRvfIJHMeyZYGW55t25Az+LectpI+lKGHqhsPATarnXP6Ws/OQrMgiGfmNTP
         0eXNI2lN+R4bAY7DY9RtGEZMQjm/9ydnOmQ1Ybkz6GW/SLv2s6Qz5zNhN0DCKlO7WwEe
         ogbtpU/lVXgKEroARzzSrdg73SjusqbC6QG+wEkNVxtiQ0YZI+uJip3KISSO2VJuXIS2
         NyoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786891126; x=1787495926;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=slKPyCDrN2MNA+O23XO0ScfIg+YQ5ZR+PoLwJeEJvyE=;
        b=UDNjJFt98aJmvluiFAsxo0lLyLgvVL7rBD1/Qmp3vnWzlQvuqnQ1aeS0siolkHBp6B
         hR1K72GbR0uupJHko5AnENO20S6cH71PU75s9aSjnLnOwLYyCNVFHFD7QttKvj+55NBW
         3aq8iRpfb/IcIlTeJIC3IkUIqiBE0t6T+Luxd6omaE9a5nSJXUOjR3m5qw4bsozLh9qg
         yd71pPUrykxQk7V3yzBsCritqPpVNcjRVZVYj2aEbLJjXNFPyIuj7qDDc+E/QlgGOsxO
         XRzIC+D38CqGYbx+07oMQqQ//w7IvOWl9zncKRod6Gi8EmlmU9Fn9Jn7S6v9Ct+yyhQD
         t4Zw==
X-Forwarded-Encrypted: i=1; AHgh+RquxJc6O0Vp8vFX5vDKuVYJsAXNjlPNs2KTw15X9lM9xTUjR2pBsNidAN/lHhqL8RewdgyR7+Z56HEj6QjfOAo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1iu8xo3NfWe1kIQQsFHMMGCajEQX+z8G4v2D7q6qE3dM3B8ZB
	x8RRQGNxK7u95AgJt0CyApGl0KD4hsRpptrPXwK3S6zzdvNb+WuoWJPj
X-Gm-Gg: AR+sD13Wy5GPOH0wA58bkItN3gJCV+2eomfmKTtDoaZjfy1pYcE0wiD8usOL4gH2CdH
	+eENarBFfj99916W9HotwiiMNKrpJh608N+sAB/SP7NL2JOnmaDGrImMF/GCalDLilnvlgOY67h
	TDg2V+ScISOrSvVnyEuQhSeL0IN2wKVCZ2RSL9F/qdCA1eycE0HRoSVD/CwFxdPIgyoy5oLmPuS
	Jrguki32hISZBtmJ2mNtkQ//DEl+qn/vIUqok0V13t79YI1bKSxjLKreerk4hqXtl1m90tdKGGx
	dEMeIYN5pLT41ZvVwKaLN/TRMGfh7jJbArcn235eJd3AcvAzGjmmQLz8+Uhqm9kf6pmYvQj0utd
	clma/mFBmTW/2zKLFjgYxfazj7B2DUJXC/OcOBz9FZPAOG3FxhkEIVxkrCN2mcn7WSM0A//ee+E
	MBWyq/XvzPWyKV98zewI/s+2X/b18u+skxSrdSYNiqu6RLojbYWuuxJqc855bHPd80QnVaIU6s+
	A3X4ZHR9f5a/fJ6hHjtgZH+IiKtY/Lz6xNoxeQgEycQtmPEToTu
X-Received: by 2002:a05:600c:6290:b0:495:4689:1e98 with SMTP id 5b1f17b1804b1-4998e074297mr203471005e9.10.1786891126238;
        Sun, 16 Aug 2026 07:38:46 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4999611b043sm72992295e9.12.2026.08.16.07.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 07:38:45 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: richard.henderson@linaro.org,
	linmag7@gmail.com
Cc: qi.zheng@linux.dev,
	akpm@linux-foundation.org,
	viro@zeniv.linux.org.uk,
	geert@linux-m68k.org,
	catalin.marinas@arm.com,
	rppt@kernel.org,
	joao@joaoff.com,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH] alpha: cleanup dead ALPHA_LARGE_VMALLOC
Date: Sun, 16 Aug 2026 15:38:35 +0100
Message-ID: <20260816143835.1068971-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, the ALPHA_LARGE_VMALLOC config option can never be enabled,
meaning that all references to it are dead code.

Let's remove this dead option and its associated code.

This dead code was found by kconfirm, a static analysis tool for Kconfig.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 arch/alpha/Kconfig               | 15 ---------------
 arch/alpha/include/asm/pgtable.h |  4 ----
 arch/alpha/mm/fault.c            | 24 ------------------------
 arch/alpha/mm/init.c             | 10 ++--------
 4 files changed, 2 insertions(+), 51 deletions(-)

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index 7b7dafe7d9df..fdffcea749ac 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -413,21 +413,6 @@ config ALPHA_WTINT
 
 	  If unsure, say N.
 
-# LARGE_VMALLOC is racy, if you *really* need it then fix it first
-config ALPHA_LARGE_VMALLOC
-	bool
-	help
-	  Process creation and other aspects of virtual memory management can
-	  be streamlined if we restrict the kernel to one PGD for all vmalloc
-	  allocations.  This equates to about 8GB.
-
-	  Under normal circumstances, this is so far and above what is needed
-	  as to be laughable.  However, there are certain applications (such
-	  as benchmark-grade in-kernel web serving) that can make use of as
-	  much vmalloc space as is available.
-
-	  Say N unless you know you need gobs and gobs of vmalloc space.
-
 config VERBOSE_MCHECK
 	bool "Verbose Machine Checks"
 
diff --git a/arch/alpha/include/asm/pgtable.h b/arch/alpha/include/asm/pgtable.h
index 8e00cf9dc39d..3d7c1bab4154 100644
--- a/arch/alpha/include/asm/pgtable.h
+++ b/arch/alpha/include/asm/pgtable.h
@@ -50,11 +50,7 @@ struct vm_area_struct;
 /* Number of pointers that fit on a page:  this will go away. */
 #define PTRS_PER_PAGE	(1UL << (PAGE_SHIFT-3))
 
-#ifdef CONFIG_ALPHA_LARGE_VMALLOC
-#define VMALLOC_START		0xfffffe0000000000
-#else
 #define VMALLOC_START		(-2*PGDIR_SIZE)
-#endif
 #define VMALLOC_END		(-PGDIR_SIZE)
 
 /*
diff --git a/arch/alpha/mm/fault.c b/arch/alpha/mm/fault.c
index a9816bbc9f34..0bc5fc4d510e 100644
--- a/arch/alpha/mm/fault.c
+++ b/arch/alpha/mm/fault.c
@@ -111,10 +111,6 @@ do_page_fault(unsigned long address, unsigned long mmcsr,
 	if (!mm || faulthandler_disabled())
 		goto no_context;
 
-#ifdef CONFIG_ALPHA_LARGE_VMALLOC
-	if (address >= TASK_SIZE)
-		goto vmalloc_fault;
-#endif
 	if (user_mode(regs))
 		flags |= FAULT_FLAG_USER;
 	perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS, 1, regs, address);
@@ -225,24 +221,4 @@ do_page_fault(unsigned long address, unsigned long mmcsr,
  do_sigsegv:
 	force_sig_fault(SIGSEGV, si_code, (void __user *) address);
 	return;
-
-#ifdef CONFIG_ALPHA_LARGE_VMALLOC
- vmalloc_fault:
-	if (user_mode(regs))
-		goto do_sigsegv;
-	else {
-		/* Synchronize this task's top level page-table
-		   with the "reference" page table from init.  */
-		long index = pgd_index(address);
-		pgd_t *pgd, *pgd_k;
-
-		pgd = current->active_mm->pgd + index;
-		pgd_k = swapper_pg_dir + index;
-		if (!pgd_present(*pgd) && pgd_present(*pgd_k)) {
-			pgd_val(*pgd) = pgd_val(*pgd_k);
-			return;
-		}
-		goto no_context;
-	}
-#endif
 }
diff --git a/arch/alpha/mm/init.c b/arch/alpha/mm/init.c
index 9531cbc761c0..a2b4d001cbf2 100644
--- a/arch/alpha/mm/init.c
+++ b/arch/alpha/mm/init.c
@@ -45,12 +45,7 @@ pgd_alloc(struct mm_struct *mm)
 	ret = __pgd_alloc(mm, 0);
 	init = pgd_offset(&init_mm, 0UL);
 	if (ret) {
-#ifdef CONFIG_ALPHA_LARGE_VMALLOC
-		memcpy (ret + USER_PTRS_PER_PGD, init + USER_PTRS_PER_PGD,
-			(PTRS_PER_PGD - USER_PTRS_PER_PGD - 1)*sizeof(pgd_t));
-#else
 		pgd_val(ret[PTRS_PER_PGD-2]) = pgd_val(init[PTRS_PER_PGD-2]);
-#endif
 
 		/* The last PGD entry is the VPTB self-map.  */
 		pgd_val(ret[PTRS_PER_PGD-1])
@@ -148,9 +143,8 @@ callback_init(void * kernel_end)
 	   On systems with larger consoles, additional pages will be
 	   allocated as needed during the mapping process.
 
-	   In the case of not SRM, but not CONFIG_ALPHA_LARGE_VMALLOC,
-	   we need to allocate the PGD we use for vmalloc before we start
-	   forking other tasks.  */
+	   In the case of not SRM, we need to allocate the PGD we use for vmalloc
+	   before we start forking other tasks.  */
 
 	two_pages = (void *)
 	  (((unsigned long)kernel_end + ~PAGE_MASK) & PAGE_MASK);
-- 
2.55.0

