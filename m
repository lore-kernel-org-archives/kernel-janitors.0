From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 24 Oct 2012 11:59:19 +0000
Subject: Re: [PATCH 1/1] x86:Remove unnecessary (void *) pointer casts
Message-Id: <20121024115919.GD20120@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1351070670-27488-1-git-send-email-firogm@gmail.com>
In-Reply-To: <1351070670-27488-1-git-send-email-firogm@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Oct 24, 2012 at 05:24:30PM +0800, Firo Yang wrote:
> @@ -379,7 +379,7 @@ static void __set_pmd_pte(pte_t *kpte, unsigned long address, pte_t pte)
> 			pud_t *pud;
> 			pmd_t *pmd;
> 
> -			pgd = (pgd_t *)page_address(page) + pgd_index(address);
> +			pgd = page_address(page) + pgd_index(address);

This cast is actually needed.  It changes how the math works.

Really it's not a good idea to start with things under arch/ or mm/.
That code is already written to a much higher standard so things
which look like mistake are maybe done for some subtle reason.

We all make mistakes, but it's better to test things if you are able
to and perhaps this could have been avoided.  (I don't know).

regards,
dan carpenter

