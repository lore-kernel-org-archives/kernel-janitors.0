From: Thomas Gleixner <tglx@linutronix.de>
Date: Mon, 05 Sep 2016 09:19:51 +0000
Subject: Re: [PATCH 1/4] x86/smpboot: Use kmalloc_array() in smp_init_package_map()
Message-Id: <alpine.DEB.2.20.1609051116490.5647@nanos>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6dacb257-d15c-8ea1-9dd4-0440a5ecfd1d@users.sourceforge.net> <190dbaf0-e4ef-859a-346b-eb5ae5dfe583@users.sourceforge.net>
In-Reply-To: <190dbaf0-e4ef-859a-346b-eb5ae5dfe583@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: x86@kernel.org, Andi Kleen <ak@linux.intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov <bp@suse.de>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@redhat.com>, =?ISO-8859-15?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, Len Brown <len.brown@intel.com>, Peter Zijlstra <peterz@infradead.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Paolo Bonzini <pbonzini@redhat.com>

On Mon, 5 Sep 2016, SF Markus Elfring wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 5 Sep 2016 08:30:20 +0200
> 
> * A multiplication for the size determination of a memory allocation
>   indicated that an array data structure should be processed.
>   Thus use the corresponding function "kmalloc_array".
> 
>   This issue was detected by using the Coccinelle software.
> 
> * Replace the specification of a data type by a pointer dereference
>   to make the corresponding size determination a bit safer according to
>   the Linux coding style convention.
> 
> * Move a calculation for one function call.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  arch/x86/kernel/smpboot.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
> index 3878725..36cf27e 100644
> --- a/arch/x86/kernel/smpboot.c
> +++ b/arch/x86/kernel/smpboot.c
> @@ -349,9 +349,12 @@ static void __init smp_init_package_map(void)
>  	 * package can be smaller than the actual used apic ids.
>  	 */
>  	max_physical_pkg_id = DIV_ROUND_UP(MAX_LOCAL_APIC, ncpus);
> -	size = max_physical_pkg_id * sizeof(unsigned int);
> -	physical_to_logical_pkg = kmalloc(size, GFP_KERNEL);
> -	memset(physical_to_logical_pkg, 0xff, size);
> +	physical_to_logical_pkg = kmalloc_array(max_physical_pkg_id,
> +						sizeof(*physical_to_logical_pkg),
> +						GFP_KERNEL);
> +	memset(physical_to_logical_pkg,
> +	       0xff,
> +	       sizeof(*physical_to_logical_pkg) * max_physical_pkg_id);


Why are you replacing well readable code by this line breaked crap?

Stop acting like a shell script or we might replace you by one.

Thanks,

	tglx
