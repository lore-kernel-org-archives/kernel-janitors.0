From: Al Viro <viro@ftp.linux.org.uk>
Date: Fri, 27 Jul 2007 10:00:04 +0000
Subject: Re: [PATCH 06/68] 0 -> NULL, for arch/frv
Message-Id: <20070727100004.GV27237@ftp.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707270944.LAA17167@ifs.emn.fr>
In-Reply-To: <200707270944.LAA17167@ifs.emn.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yoann Padioleau <padator@wanadoo.fr>
Cc: kernel-janitors@vger.kernel.org, dhowells@redhat.com, akpm@linux-foundation.org, linux-kernel@vger.kernel.org

On Fri, Jul 27, 2007 at 11:44:35AM +0200, Yoann Padioleau wrote:
>  	pte = pte_alloc_kernel(pme, va);
> -	if (pte != 0) {
> +	if (pte != NULL) {
>  		err = 0;
>  		set_pte(pte, mk_pte_phys(pa & PAGE_MASK, prot));
>  	}
> @@ -99,7 +99,7 @@ void *consistent_alloc(gfp_t gfp, size_t
>  
>  	/* allocate some common virtual space to map the new pages */
>  	area = get_vm_area(size, VM_ALLOC);
> -	if (area = 0) {
> +	if (area = NULL) {
>  		free_pages(page, order);
>  		return NULL;

Same comment about comparisons with NULL after allocation...
