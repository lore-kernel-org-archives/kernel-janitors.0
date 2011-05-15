From: Borislav Petkov <borislav.petkov@amd.com>
Date: Sun, 15 May 2011 09:36:29 +0000
Subject: Re: [PATCH 1/3] arch/x86/kernel/cpu/mcheck/mce_amd.c: Avoid
Message-Id: <20110515093629.GB10319@aftab>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1305294731-12127-1-git-send-email-julia@diku.dk>
In-Reply-To: <1305294731-12127-1-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: Thomas Gleixner <tglx@linutronix.de>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, "x86@kernel.org" <x86@kernel.org>, "Richter, Robert" <robert.richter@amd.com>, Yinghai Lu <yinghai@kernel.org>, "Herrmann3, Andreas" <Andreas.Herrmann3@amd.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, May 13, 2011 at 09:52:09AM -0400, Julia Lawall wrote:
> b may be added to a list, but is not removed before being freed in the case
> of an error.  This is done in the corresponding deallocation function, so
> the code here has been changed to follow that.
> 
> The sematic match that finds this problem is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> expression E,E1,E2;
> identifier l;
> @@
> 
> *list_add(&E->l,E1);
> ... when != E1
>     when != list_del(&E->l)
>     when != list_del_init(&E->l)
>     when != E = E2
> *kfree(E);// </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>

Acked-by: Borislav Petkov <borislav.petkov@amd.com>

> 
> ---
>  arch/x86/kernel/cpu/mcheck/mce_amd.c |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/x86/kernel/cpu/mcheck/mce_amd.c b/arch/x86/kernel/cpu/mcheck/mce_amd.c
> index 167f97b..bb0adad 100644
> --- a/arch/x86/kernel/cpu/mcheck/mce_amd.c
> +++ b/arch/x86/kernel/cpu/mcheck/mce_amd.c
> @@ -509,6 +509,7 @@ recurse:
>  out_free:
>  	if (b) {
>  		kobject_put(&b->kobj);
> +		list_del(&b->miscj);
>  		kfree(b);
>  	}
>  	return err;
> 
> 

-- 
Regards/Gruss,
Boris.

Advanced Micro Devices GmbH
Einsteinring 24, 85609 Dornach
General Managers: Alberto Bozzo, Andrew Bowd
Registration: Dornach, Gemeinde Aschheim, Landkreis Muenchen
Registergericht Muenchen, HRB Nr. 43632

