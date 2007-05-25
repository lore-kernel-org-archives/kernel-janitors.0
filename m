From: Jiri Slaby <jirislaby@gmail.com>
Date: Fri, 25 May 2007 07:25:51 +0000
Subject: [KJ] Re: [PATCH] old declaration ritchie style fix
Message-Id: <46568F7F.1040100@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <87y7jemb1u.fsf@wanadoo.fr>
In-Reply-To: <87y7jemb1u.fsf@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yoann Padioleau <padator@wanadoo.fr>
Cc: kernel-janitors@lists.osdl.org, akpm@linux-foundation.org, linux-kernel@vger.kernel.org

Yoann Padioleau napsal(a):
> Use consistent function declaration style.
> 
> Note that this file is not compiled by make allyesconfig
> and its configuration option appears nowhere. Perhaps
> it would be better to remove the file.

I don't know where were you looking, but it is referenced in both Makefile and
Kconfig in drivers/net/ and depends on ATARI && ATARI_ACSI && BROKEN. I suppose
you don't have atari.

> ---
> 
>  atari_pamsnet.c |   62 +++++++++++++++++++-------------------------------------
>  1 file changed, 22 insertions(+), 40 deletions(-)
> 
> 
> diff --git a/drivers/net/atari_pamsnet.c b/drivers/net/atari_pamsnet.c
> index 5471440..ea5b868 100644
> --- a/drivers/net/atari_pamsnet.c
> +++ b/drivers/net/atari_pamsnet.c
[...]
> @@ -501,9 +483,7 @@ pamsnet_intr(irq, data, fp)
>  /* receivepkt() loads a packet to a given buffer and returns its length */
>  
>  static int
> -receivepkt (target, buffer)
> -	int target;
> -	unsigned char *buffer;
> +receivepkt (int target, unsigned char *buffer)

When you are at it, you can also get rid of bsd return-type-on-its-own-line
style + remove the space before parenthesis.

regards,
-- 
http://www.fi.muni.cz/~xslaby/            Jiri Slaby
faculty of informatics, masaryk university, brno, cz
e-mail: jirislaby gmail com, gpg pubkey fingerprint:
B674 9967 0407 CE62 ACC8  22A0 32CC 55C3 39D4 7A7E
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
