From: Fenghua Yu <fenghua.yu@intel.com>
Date: Tue, 02 Jun 2020 22:17:28 +0000
Subject: Re: [PATCH v2] x86/resctrl: fix a NULL vs IS_ERR() static checker warning
Message-Id: <20200602221727.GA59412@romley-ivt3.sc.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200602193611.GA190851@mwanda>
In-Reply-To: <20200602193611.GA190851@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Jun 02, 2020 at 10:36:11PM +0300, Dan Carpenter wrote:
> The callers don't expect *d_cdp to be set to an error pointer, they only
> check for NULL.  This leads to a static checker warning:
> 
>     arch/x86/kernel/cpu/resctrl/rdtgroup.c:2648 __init_one_rdt_domain()
>     warn: 'd_cdp' could be an error pointer
> 
> This would not trigger a bug in this specific case because
> __init_one_rdt_domain() calls it with a valid domain that would not have
> a negative id and thus not trigger the return of the ERR_PTR(). If this
> was a negative domain id then the call to rdt_find_domain() in
> domain_add_cpu() would have returned the ERR_PTR() much earlier and the
> creation of the domain with an invalid id would have been prevented.
> 
> Even though a bug is not triggered currently the right and safe thing to
> do is to set the pointer to NULL because that is what can be checked for
> when the caller is handling the CDP and non-CDP cases.
> 
> Fixes: 52eb74339a62 ("x86/resctrl: Fix rdt_find_domain() return value and checks")

Acked-by: Fenghua Yu <fenghua.yu@intel.com>
