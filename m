From: Casey Schaufler <casey@schaufler-ca.com>
Date: Thu, 09 Feb 2017 18:44:53 +0000
Subject: Re: [PATCH][V2] Smack: fix a dereference before null check on sock->sk
Message-Id: <a01d151d-50ed-c778-d30f-2b9e1c8defb6@schaufler-ca.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170209171127.5029-1-colin.king@canonical.com>
In-Reply-To: <20170209171127.5029-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, James Morris <james.l.morris@oracle.com>, "Serge E . Hally" <serge@hallyn.com>, linux-security-module@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 2/9/2017 9:11 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> The initialisation of pointer ssp is from a dereference on sock->sk
> before sock-sk is null checked, hence there is a potential for a
> null pointer deference.  Fix this by moving the assignment of ssp
> to just before it is used in the call to smk_ipv6_check.
>
> Also minor clean up of code to reduce #ifdef noise.
> Detected with CoverityScan, CID#1324196 ("Dereference before null check")
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  security/smack/smack_lsm.c | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
>
> diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
> index fc8fb31..0c5656d 100644
> --- a/security/smack/smack_lsm.c
> +++ b/security/smack/smack_lsm.c
> @@ -2897,10 +2897,6 @@ static int smack_socket_connect(struct socket *sock, struct sockaddr *sap,
>  #if IS_ENABLED(CONFIG_IPV6)
>  	struct sockaddr_in6 *sip = (struct sockaddr_in6 *)sap;
>  #endif
> -#ifdef SMACK_IPV6_SECMARK_LABELING
> -	struct smack_known *rsp;
> -	struct socket_smack *ssp = sock->sk->sk_security;
> -#endif
>  
>  	if (sock->sk = NULL)
>  		return 0;
> @@ -2915,10 +2911,17 @@ static int smack_socket_connect(struct socket *sock, struct sockaddr *sap,
>  		if (addrlen < sizeof(struct sockaddr_in6))
>  			return -EINVAL;
>  #ifdef SMACK_IPV6_SECMARK_LABELING
> -		rsp = smack_ipv6host_label(sip);
> -		if (rsp != NULL)
> -			rc = smk_ipv6_check(ssp->smk_out, rsp, sip,
> -						SMK_CONNECTING);
> +		{
> +			struct smack_known *rsp = smack_ipv6host_label(sip);

I make a habit of not using nested declarations.
I appreciate the intent of the patch, but I would
rather take a more global approach to the cleanup.

> +
> +			if (rsp != NULL) {
> +				struct socket_smack *ssp > +					sock->sk->sk_security;
> +
> +				rc = smk_ipv6_check(ssp->smk_out, rsp, sip,
> +						    SMK_CONNECTING);
> +			}
> +		}
>  #endif
>  #ifdef SMACK_IPV6_PORT_LABELING
>  		rc = smk_ipv6_port_check(sock->sk, sip, SMK_CONNECTING);

