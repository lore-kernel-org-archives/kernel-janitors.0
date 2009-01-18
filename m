From: Leonardo Potenza <leo.potenza@gmail.com>
Date: Sun, 18 Jan 2009 22:03:56 +0000
Subject: [PATCH] x86: fix section mismatch warnings in kernel/setup_percpu.c
Message-Id: <200901182303.56911.lpotenza@inwind.it>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090107112410.GB30522@elte.hu>
In-Reply-To: <20090107112410.GB30522@elte.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: mingo@redhat.com, linux-kernel@vger.kernel.org

From: Leonardo Potenza <lpotenza@inwind.it>

The function setup_cpu_local_masks() has been marked __init, in order to remove the following section mismatch messages:

WARNING: vmlinux.o(.text+0x3c2c7): Section mismatch in reference from the function setup_cpu_local_masks() to the function .init.text:alloc_bootmem_cpumask_var()
The function setup_cpu_local_masks() references
the function __init alloc_bootmem_cpumask_var().
This is often because setup_cpu_local_masks lacks a __init 
annotation or the annotation of alloc_bootmem_cpumask_var is wrong.

WARNING: vmlinux.o(.text+0x3c2d3): Section mismatch in reference from the function setup_cpu_local_masks() to the function .init.text:alloc_bootmem_cpumask_var()
The function setup_cpu_local_masks() references
the function __init alloc_bootmem_cpumask_var().
This is often because setup_cpu_local_masks lacks a __init 
annotation or the annotation of alloc_bootmem_cpumask_var is wrong.

WARNING: vmlinux.o(.text+0x3c2df): Section mismatch in reference from the function setup_cpu_local_masks() to the function .init.text:alloc_bootmem_cpumask_var()
The function setup_cpu_local_masks() references
the function __init alloc_bootmem_cpumask_var().
This is often because setup_cpu_local_masks lacks a __init 
annotation or the annotation of alloc_bootmem_cpumask_var is wrong.

WARNING: vmlinux.o(.text+0x3c2eb): Section mismatch in reference from the function setup_cpu_local_masks() to the function .init.text:alloc_bootmem_cpumask_var()
The function setup_cpu_local_masks() references
the function __init alloc_bootmem_cpumask_var().
This is often because setup_cpu_local_masks lacks a __init 
annotation or the annotation of alloc_bootmem_cpumask_var is wrong.

Signed-off-by: Leonardo Potenza <lpotenza@inwind.it>
---
Index: linux-2.6/arch/x86/kernel/setup_percpu.c
=================================--- linux-2.6.orig/arch/x86/kernel/setup_percpu.c	2009-01-18 22:20:13.000000000 +0100
+++ linux-2.6/arch/x86/kernel/setup_percpu.c	2009-01-18 22:21:19.000000000 +0100
@@ -136,7 +136,7 @@ static void __init setup_cpu_pda_map(voi
 #ifdef CONFIG_X86_64
 
 /* correctly size the local cpu masks */
-static void setup_cpu_local_masks(void)
+static void __init setup_cpu_local_masks(void)
 {
 	alloc_bootmem_cpumask_var(&cpu_initialized_mask);
 	alloc_bootmem_cpumask_var(&cpu_callin_mask);
