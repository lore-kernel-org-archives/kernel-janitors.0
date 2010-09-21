From: Jeremy Fitzhardinge <jeremy@goop.org>
Date: Tue, 21 Sep 2010 18:39:23 +0000
Subject: Re: [PATCH 1/4] x86: remove cast from void*
Message-Id: <4C98FBDB.6030601@goop.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1284441511-11511-1-git-send-email-mfm@muteddisk.com>
In-Reply-To: <1284441511-11511-1-git-send-email-mfm@muteddisk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: matt mooney <mfm@muteddisk.com>
Cc: xen-devel@lists.xensource.com, Jeremy Fitzhardinge <jeremy@xensource.com>, x86@kernel.org, kernel-janitors@vger.kernel.org, Chris Wright <chrisw@sous-sol.org>, virtualization@lists.osdl.org, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Tejun Heo <tj@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ian Campbell <ian.campbell@citrix.com>

 On 09/13/2010 10:18 PM, matt mooney wrote:
> Unnecessary cast from void* in assignment.
>
> Signed-off-by: matt mooney <mfm@muteddisk.com>
> ---
>  arch/x86/xen/mmu.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/arch/x86/xen/mmu.c b/arch/x86/xen/mmu.c
> index 42086ac..7436283 100644
> --- a/arch/x86/xen/mmu.c
> +++ b/arch/x86/xen/mmu.c
> @@ -737,7 +737,7 @@ pgd_t *xen_get_user_pgd(pgd_t *pgd)
>  
>  	if (offset < pgd_index(USER_LIMIT)) {
>  		struct page *page = virt_to_page(pgd_page);
> -		user_ptr = (pgd_t *)page->private;
> +		user_ptr = page->private;

Um, page->private is unsigned long anyway, so this is needed either way.

    J

