From: Domen Puncer <domen@coderock.org>
Date: Tue, 05 Jul 2005 14:00:16 +0000
Subject: Re: [KJ] [PATCH 2.6.13-rc1 14/17] fix sparse warnings (__nocast type)
Message-Id: <20050705140016.GB2257@homer.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============73866688000690783=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200507031904.44301.victor@cetuc.puc-rio.br>
In-Reply-To: <200507031904.44301.victor@cetuc.puc-rio.br>
To: kernel-janitors@vger.kernel.org

--===============73866688000690783==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 03/07/05 19:04 +0000, Victor Fusco wrote:
> Description:
> 	Fix the sparse warning "implicit cast to nocast type"
>  
> File/Subsystem: net/core
> 
> Signed-off-by: Victor Fusco <victor@cetuc.puc-rio.br>
>  

>  include/linux/security.h |    8 +++++---

How is this related to net/?

>  include/linux/skbuff.h   |   29 ++++++++++++++++++-----------
>  include/net/sock.h       |   16 ++++++++++------
>  net/core/dev.c           |    2 +-
>  net/core/skbuff.c        |   17 ++++++++++-------
>  net/core/sock.c          |   11 +++++++----
>  6 files changed, 51 insertions(+), 32 deletions(-)
> 
> Index: linux-2.6-git/net/core/skbuff.c
> ===================================================================
> --- linux-2.6-git.orig/net/core/skbuff.c	2005-07-03 16:44:23.000000000 +0000
> +++ linux-2.6-git/net/core/skbuff.c	2005-07-03 17:12:52.000000000 +0000
> @@ -129,7 +129,7 @@
>   *	Buffers may only be allocated from interrupts using a @gfp_mask of
>   *	%GFP_ATOMIC.
>   */
> -struct sk_buff *alloc_skb(unsigned int size, int gfp_mask)
> +struct sk_buff *alloc_skb(unsigned int size, unsigned int __nocast gfp_mask)
>  {
>  	struct sk_buff *skb;
>  	u8 *data;
> @@ -182,7 +182,8 @@
>   *	%GFP_ATOMIC.
>   */
>  struct sk_buff *alloc_skb_from_cache(kmem_cache_t *cp,
> -				     unsigned int size, int gfp_mask)
> +				     unsigned int size,
> +                                     unsigned int __nocast gfp_mask)

Why not tabs in second line too?
Same goes for the rest of patch.


--===============73866688000690783==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============73866688000690783==--
