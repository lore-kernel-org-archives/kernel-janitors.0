From: Richard Weinberger <richard@nod.at>
Date: Tue, 01 Nov 2016 11:42:25 +0000
Subject: Re: [PATCH] UBIFS: Remove some dead code
Message-Id: <a074d673-cf23-d7a1-7b1e-0e1f8f7b0ffe@nod.at>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161101064525.11813-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20161101064525.11813-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, dedekind1@gmail.com, adrian.hunter@intel.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



On 01.11.2016 07:45, Christophe JAILLET wrote:
> 'ubifs_fast_find_freeable()' can not return an error pointer, so this test
> can be removed.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  fs/ubifs/gc.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/fs/ubifs/gc.c b/fs/ubifs/gc.c
> index e845c64b6ce1..7b35e3d6cde7 100644
> --- a/fs/ubifs/gc.c
> +++ b/fs/ubifs/gc.c
> @@ -846,10 +846,6 @@ int ubifs_gc_start_commit(struct ubifs_info *c)
>  	 */
>  	while (1) {
>  		lp = ubifs_fast_find_freeable(c);
> -		if (IS_ERR(lp)) {
> -			err = PTR_ERR(lp);
> -			goto out;
> -		}

Good catch, how did you find this?
If you have a tool/script I'd like to use it too.

Thanks,
//richard
