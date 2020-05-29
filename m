From: Reinette Chatre <reinette.chatre@intel.com>
Date: Fri, 29 May 2020 18:28:00 +0000
Subject: Re: [PATCH] x86/resctrl: fix a NULL vs IS_ERR() static checker warning
Message-Id: <e27321cb-293e-7919-33fe-ad8381cd9993@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200529122744.GA1217265@mwanda>
In-Reply-To: <20200529122744.GA1217265@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Fenghua Yu <fenghua.yu@intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

On 5/29/2020 5:27 AM, Dan Carpenter wrote:
> The callers don't expect *d_cdp to be set to an error pointer, they only
> check for NULL.  This leads to a static checker warning:
> 
>     arch/x86/kernel/cpu/resctrl/rdtgroup.c:2648 __init_one_rdt_domain()
>     warn: 'd_cdp' could be an error pointer
> 
> I don't think this will lead to a real life bug, but it's easy enough to
> change it to be NULL.

Using "I don't think" could be a bit vague to the reader. It could be
changed to:

"This would not trigger a bug in this specific case because
__init_one_rdt_domain() calls it with a valid domain that would not have
a negative id and thus not trigger the return of the ERR_PTR(). If this
was a negative domain id then the call to rdt_find_domain() in
domain_add_cpu() would have returned the ERR_PTR() much earlier and the
creation of the domain with an invalid id would have been prevented.

Even though a bug is not triggered currently the right and safe thing to
do is to set the pointer to NULL because that is what can be checked for
when the caller is handling the CDP and non-CDP cases."


> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  arch/x86/kernel/cpu/resctrl/rdtgroup.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> index 23b4b61319d3f..3f844f14fc0a6 100644
> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> @@ -1117,6 +1117,7 @@ static int rdt_cdp_peer_get(struct rdt_resource *r, struct rdt_domain *d,
>  	_d_cdp = rdt_find_domain(_r_cdp, d->id, NULL);
>  	if (WARN_ON(IS_ERR_OR_NULL(_d_cdp))) {
>  		_r_cdp = NULL;
> +		_d_cdp = NULL;
>  		ret = -EINVAL;
>  	}
>  
> 


The below fixes tag may be helpful:
Fixes: 52eb74339a62 ("x86/resctrl: Fix rdt_find_domain() return value
and checks")

Thank you very much for catching this and sending a fix. I just have the
commit message comments, apart from that the your fix looks good to me.

Acked-by: Reinette Chatre <reinette.chatre@intel.com>

Reinette
