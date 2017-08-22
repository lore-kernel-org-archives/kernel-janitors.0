From: Borislav Petkov <bp@alien8.de>
Date: Tue, 22 Aug 2017 21:13:35 +0000
Subject: Re: [PATCH] x86/microcode/intel: Silence a static checker warning
Message-Id: <20170822211335.r7wcfcisdlq2xwgz@pd.tnic>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170822204454.mtpqqcgqibhmwfrm@mwanda>
In-Reply-To: <20170822204454.mtpqqcgqibhmwfrm@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Aug 22, 2017 at 11:44:54PM +0300, Dan Carpenter wrote:
> Smatch complains

Haha, smatch complains.

> that we could dereference a "p" when it's an error
> pointer.  It's seems unlikely, but it's easy enough to make the checker
> happy.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/arch/x86/kernel/cpu/microcode/intel.c b/arch/x86/kernel/cpu/microcode/intel.c
> index 59edbe9d4ccb..c9c46a138e0e 100644
> --- a/arch/x86/kernel/cpu/microcode/intel.c
> +++ b/arch/x86/kernel/cpu/microcode/intel.c
> @@ -208,7 +208,7 @@ static void save_microcode_patch(void *data, unsigned int size)
>  	 * address as the APs are running from physical addresses, before
>  	 * paging has been enabled.
>  	 */
> -	if (p) {

A bit higher in that same function:

	if (IS_ERR(p))
		pr_err("Error allocating buffer for %p\n", data);

A proper fix would be:

	if (IS_ERR_OR_NULL(p)) {
		pr_err("Error allocating buffer for %p\n", data);
		return;
	}

and then drop the if (p) check below.

The same should be done in the above list_for_each_entry_safe() loop.

Thx.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
