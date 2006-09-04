From: Domen Puncer <domen@coderock.org>
Date: Mon, 04 Sep 2006 22:13:55 +0000
Subject: Re: [KJ] [PATCH] Pointed by kj-devel.pl over drivers/ide/ide.c
Message-Id: <20060904221355.GE26935@nd47.coderock.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060902233239.4A23C49B6BE@ws1-3a.us4.outblaze.com>
In-Reply-To: <20060902233239.4A23C49B6BE@ws1-3a.us4.outblaze.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 02/09/06 18:32 -0500, Mauricio Mauad wrote:
> Hi,
> 
>     I'm just sending you a very simple patch just to follow the guidelines
> pointed on the TODO list. That's the way? If yes, I will send you some more.

Missing description, "Signed-off-by:".
> 
> diff --git a/drivers/ide/ide.c b/drivers/ide/ide.c
> index 3fdab56..3276391 100644
> --- a/drivers/ide/ide.c
> +++ b/drivers/ide/ide.c
> @@ -1427,8 +1427,8 @@ static int __init stridx (const char *s,
>   */
>  static int __init match_parm (char *s, const char *keywords[], int vals[], int max_vals)
>  {
> -       static const char *decimal = "0123456789";
> -       static const char *hex = "0123456789abcdef";
> +       static const char decimal[] = "0123456789";
> +       static const char hex[] = "0123456789abcdef";

size(1) output would be nice for these.

And in this case using a common global variable would be better.
It should save more space.


	Domen

>         int i, n;
> 
>         if (*s++ = '=') {
> 
> 
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> https://lists.osdl.org/mailman/listinfo/kernel-janitors
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
