From: Leonardo Potenza <lpotenza@inwind.it>
Date: Tue, 06 Jan 2009 22:58:29 +0000
Subject: [PATCH] x86: fix section mismatch warnings in mcheck/mce_amd_64.c
Message-Id: <200901062358.29954.lpotenza@inwind.it>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: mingo@redhat.com, linux-kernel@vger.kernel.org

From: Leonardo Potenza <lpotenza@inwind.it>

The function local_allocate_threshold_blocks() has been marked __cpuinit, in order to remove the following section mismatch messages:

WARNING: arch/x86/kernel/cpu/mcheck/built-in.o(.text+0x1363): Section mismatch in reference from the function local_allocate_threshold_blocks() to the function .cpuinit.text:allocate_threshold_blocks()
The function local_allocate_threshold_blocks() references
the function __cpuinit allocate_threshold_blocks().
This is often because local_allocate_threshold_blocks lacks a __cpuinit 
annotation or the annotation of allocate_threshold_blocks is wrong.

WARNING: arch/x86/kernel/cpu/built-in.o(.text+0x1def): Section mismatch in reference from the function local_allocate_threshold_blocks() to the function .cpuinit.text:allocate_threshold_blocks()
The function local_allocate_threshold_blocks() references
the function __cpuinit allocate_threshold_blocks().
This is often because local_allocate_threshold_blocks lacks a __cpuinit 
annotation or the annotation of allocate_threshold_blocks is wrong.

WARNING: arch/x86/kernel/built-in.o(.text+0xef2b): Section mismatch in reference from the function local_allocate_threshold_blocks() to the function .cpuinit.text:allocate_threshold_blocks()
The function local_allocate_threshold_blocks() references
the function __cpuinit allocate_threshold_blocks().
This is often because local_allocate_threshold_blocks lacks a __cpuinit 
annotation or the annotation of allocate_threshold_blocks is wrong.

Signed-off-by: Leonardo Potenza <lpotenza@inwind.it>
---
Index: linux-2.6/arch/x86/kernel/cpu/mcheck/mce_amd_64.c
=================================--- linux-2.6.orig/arch/x86/kernel/cpu/mcheck/mce_amd_64.c	2009-01-06 23:03:19.000000000 +0100
+++ linux-2.6/arch/x86/kernel/cpu/mcheck/mce_amd_64.c	2009-01-06 23:07:00.000000000 +0100
@@ -462,7 +462,7 @@ out_free:
 	return err;
 }
 
-static long local_allocate_threshold_blocks(void *_bank)
+static __cpuinit long local_allocate_threshold_blocks(void *_bank)
 {
 	unsigned int *bank = _bank;
 
