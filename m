From: Kees Cook <keescook@chromium.org>
Date: Tue, 06 Sep 2016 21:49:50 +0000
Subject: Re: [PATCH] x86-ksysfs: Use kmalloc_array() in create_setup_data_nodes()
Message-Id: <CAGXu5jLSsU+daPP=uX+3T02RkTFguG1rtemOF-7Py_Fi=qYP6A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3b21b2d7-9856-009c-9bd1-3a76a83bc7fc@users.sourceforge.net>
In-Reply-To: <3b21b2d7-9856-009c-9bd1-3a76a83bc7fc@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@redhat.com>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, "x86@kernel.org" <x86@kernel.org>, Dave Young <dyoung@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Matt Fleming <matt.fleming@intel.com>, Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Paolo Bonzini <pbonzini@redhat.com>

On Sun, Sep 4, 2016 at 4:23 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 4 Sep 2016 22:15:09 +0200
>
> A multiplication for the size determination of a memory allocation
> indicated that an array data structure should be processed.
> Thus use the corresponding function "kmalloc_array".
>
> This issue was detected by using the Coccinelle software.

Which rule-set was used?

>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

While probably impossible to overflow in the real world, it's still
better to use the right function here.

Acked-by: Kees Cook <keescook@chromium.org>

> ---
>  arch/x86/kernel/ksysfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/x86/kernel/ksysfs.c b/arch/x86/kernel/ksysfs.c
> index 4afc67f..cddf3c6 100644
> --- a/arch/x86/kernel/ksysfs.c
> +++ b/arch/x86/kernel/ksysfs.c
> @@ -283,7 +283,7 @@ static int __init create_setup_data_nodes(struct kobject *parent)
>         if (ret)
>                 goto out_setup_data_kobj;
>
> -       kobjp = kmalloc(sizeof(*kobjp) * nr, GFP_KERNEL);
> +       kobjp = kmalloc_array(nr, sizeof(*kobjp), GFP_KERNEL);
>         if (!kobjp) {
>                 ret = -ENOMEM;
>                 goto out_setup_data_kobj;
> --
> 2.9.3
>



-- 
Kees Cook
Nexus Security
