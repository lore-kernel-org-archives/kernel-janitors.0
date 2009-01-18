From: Ingo Molnar <mingo@elte.hu>
Date: Sun, 18 Jan 2009 22:59:45 +0000
Subject: Re: [PATCH] x86: fix section mismatch warnings in
Message-Id: <20090118225945.GA3845@elte.hu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200901182303.56911.lpotenza@inwind.it>
In-Reply-To: <200901182303.56911.lpotenza@inwind.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Leonardo Potenza <leo.potenza@gmail.com>
Cc: kernel-janitors@vger.kernel.org, mingo@redhat.com, linux-kernel@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>


* Leonardo Potenza <leo.potenza@gmail.com> wrote:

> From: Leonardo Potenza <lpotenza@inwind.it>
> 
> The function setup_cpu_local_masks() has been marked __init, in order to remove the following section mismatch messages:
> 
> WARNING: vmlinux.o(.text+0x3c2c7): Section mismatch in reference from the function setup_cpu_local_masks() to the function .init.text:alloc_bootmem_cpumask_var()
> The function setup_cpu_local_masks() references
> the function __init alloc_bootmem_cpumask_var().
> This is often because setup_cpu_local_masks lacks a __init 
> annotation or the annotation of alloc_bootmem_cpumask_var is wrong.
> 
> WARNING: vmlinux.o(.text+0x3c2d3): Section mismatch in reference from the function setup_cpu_local_masks() to the function .init.text:alloc_bootmem_cpumask_var()
> The function setup_cpu_local_masks() references
> the function __init alloc_bootmem_cpumask_var().
> This is often because setup_cpu_local_masks lacks a __init 
> annotation or the annotation of alloc_bootmem_cpumask_var is wrong.
> 
> WARNING: vmlinux.o(.text+0x3c2df): Section mismatch in reference from the function setup_cpu_local_masks() to the function .init.text:alloc_bootmem_cpumask_var()
> The function setup_cpu_local_masks() references
> the function __init alloc_bootmem_cpumask_var().
> This is often because setup_cpu_local_masks lacks a __init 
> annotation or the annotation of alloc_bootmem_cpumask_var is wrong.
> 
> WARNING: vmlinux.o(.text+0x3c2eb): Section mismatch in reference from the function setup_cpu_local_masks() to the function .init.text:alloc_bootmem_cpumask_var()
> The function setup_cpu_local_masks() references
> the function __init alloc_bootmem_cpumask_var().
> This is often because setup_cpu_local_masks lacks a __init 
> annotation or the annotation of alloc_bootmem_cpumask_var is wrong.
> 
> Signed-off-by: Leonardo Potenza <lpotenza@inwind.it>

applied to tip/x86/urgent, thanks Leonardo!

	Ingo
