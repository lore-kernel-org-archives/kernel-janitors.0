From: Casey Schaufler <casey@schaufler-ca.com>
Date: Wed, 05 Aug 2009 19:38:23 +0000
Subject: Re: [PATCH 2/2] security/smack: Use AF_INET for sin_family field
Message-Id: <4A79DFAF.2010605@schaufler-ca.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0908051434340.20453@pc-004.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0908051434340.20453@pc-004.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: James Morris <jmorris@namei.org>, linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
>
> Elsewhere the sin_family field holds a value with a name of the form
> AF_..., so it seems reasonable to do so here as well.  Also the values of
> PF_INET and AF_INET are the same.
>
> The semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
>
> // <smpl>
> @@
> struct sockaddr_in sip;
> @@
>
> (
> sip.sin_family =
> - PF_INET
> + AF_INET
> |
> sip.sin_family !> - PF_INET
> + AF_INET
> |
> sip.sin_family > - PF_INET
> + AF_INET
> )
> // </smpl>
>
> Signed-off-by: Julia Lawall <julia@diku.dk>
>   

Acked-by: Casey Schaufler <casey@schaufler-ca.com>

Yes, this is a correction. Thank you.


> ---
>  security/smack/smack_lsm.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff -u -p a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
> --- a/security/smack/smack_lsm.c
> +++ b/security/smack/smack_lsm.c
> @@ -2464,7 +2464,7 @@ static int smack_socket_sendmsg(struct s
>  	/*
>  	 * Perfectly reasonable for this to be NULL
>  	 */
> -	if (sip = NULL || sip->sin_family != PF_INET)
> +	if (sip = NULL || sip->sin_family != AF_INET)
>  		return 0;
>  
>  	return smack_netlabel_send(sock->sk, sip);
> --
> To unsubscribe from this list: send the line "unsubscribe linux-security-module" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>   

