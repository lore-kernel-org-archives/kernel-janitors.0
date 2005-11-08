From: Pekka J Enberg <penberg@cs.Helsinki.FI>
Date: Tue, 08 Nov 2005 07:51:48 +0000
Subject: [KJ] Re: [PATCH 4/8] Cleanup kmem_cache_create()
Message-Id: <Pine.LNX.4.58.0511080951230.10193@sbz-30.cs.Helsinki.FI>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============66815264995819468=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <436FF51D.8080509@us.ibm.com> <436FF70D.6040604@us.ibm.com>
In-Reply-To: <436FF70D.6040604@us.ibm.com>
To: Matthew Dobson <colpatch@us.ibm.com>
Cc: kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org

--===============66815264995819468==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Mon, 7 Nov 2005, Matthew Dobson wrote:
> @@ -1652,9 +1649,9 @@ kmem_cache_t *kmem_cache_create(const ch
>  		 * gfp() funcs are more friendly towards high-order requests,
>  		 * this should be changed.
>  		 */
> -		do {
> -			unsigned int break_flag = 0;
> -cal_wastage:
> +		unsigned int break_flag = 0;
> +
> +		for ( ; ; cachep->gfporder++) {
>  			cache_estimate(cachep->gfporder, size, align, flags,
>  						&left_over, &cachep->num);
>  			if (break_flag)
> @@ -1662,13 +1659,13 @@ cal_wastage:
>  			if (cachep->gfporder >= MAX_GFP_ORDER)
>  				break;
>  			if (!cachep->num)
> -				goto next;
> -			if (flags & CFLGS_OFF_SLAB &&
> -					cachep->num > offslab_limit) {
> +				continue;
> +			if ((flags & CFLGS_OFF_SLAB) &&
> +			    (cachep->num > offslab_limit)) {
>  				/* This num of objs will cause problems. */
> -				cachep->gfporder--;
> +				cachep->gfporder -= 2;

This is not an improvement IMHO. The use of for construct is non-intuitive
and neither is the above. A suggested cleanup is to keep the loop as is but
extract it to a function of its own.

				Pekka

--===============66815264995819468==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============66815264995819468==--
