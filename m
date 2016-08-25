From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 25 Aug 2016 11:33:36 +0000
Subject: Re: [PATCH] x86/mce: Use kmalloc_array() in mce_chrdev_read()
Message-Id: <865fa33f-2339-cafe-d3cc-ccf119c9a50d@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <88a63817-f601-28ce-ed2f-ffeb28512528@users.sourceforge.net>
In-Reply-To: <88a63817-f601-28ce-ed2f-ffeb28512528@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, linux-edac@vger.kernel.org, x86@kernel.org, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Tony Luck <tony.luck@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>



On 25/08/2016 11:17, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 25 Aug 2016 11:00:05 +0200
> 
> * A multiplication for the size determination of a memory allocation
>   indicated that an array data structure should be processed.
>   Thus reuse the corresponding function "kmalloc_array".
> 
>   This issue was detected by using the Coccinelle software.
> 
> * Replace the specification of a data type by a pointer dereference
>   to make the corresponding size determination a bit safer according to
>   the Linux coding style convention.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  arch/x86/kernel/cpu/mcheck/mce.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kernel/cpu/mcheck/mce.c b/arch/x86/kernel/cpu/mcheck/mce.c
> index 79d8ec8..0bc831d 100644
> --- a/arch/x86/kernel/cpu/mcheck/mce.c
> +++ b/arch/x86/kernel/cpu/mcheck/mce.c
> @@ -1901,7 +1901,7 @@ static ssize_t mce_chrdev_read(struct file *filp, char __user *ubuf,
>  	unsigned prev, next;
>  	int i, err;
>  
> -	cpu_tsc = kmalloc(nr_cpu_ids * sizeof(long), GFP_KERNEL);
> +	cpu_tsc = kmalloc_array(nr_cpu_ids, sizeof(*cpu_tsc), GFP_KERNEL);
>  	if (!cpu_tsc)
>  		return -ENOMEM;
>  
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

I think you can post the patches with a larger granularity (e.g. one for
all of arch/x86/kernel).

Paolo
