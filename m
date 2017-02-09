From: walter harms <wharms@bfs.de>
Date: Thu, 09 Feb 2017 13:09:11 +0000
Subject: Re: [PATCH] Smack: fix a dereference before null check on sock->sk
Message-Id: <589C69F7.8030603@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170209120301.28152-1-colin.king@canonical.com>
In-Reply-To: <20170209120301.28152-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Casey Schaufler <casey@schaufler-ca.com>, James Morris <james.l.morris@oracle.com>, "Serge E . Hallyn" <serge@hallyn.com>, linux-security-module@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



Am 09.02.2017 13:03, schrieb Colin King:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The initialisation of pointer ssp is from a dereference on sock->sk
> before sock-sk is null checked, hence there is a potential for a
> null pointer deference.  Fix this by moving the assignment of ssp
> to just before it is used in the call to smk_ipv6_check.
> 
> Detected with CoverityScan, CID#1324196 ("Dereference before null check")
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  security/smack/smack_lsm.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
> index fc8fb31..bb17387 100644
> --- a/security/smack/smack_lsm.c
> +++ b/security/smack/smack_lsm.c
> @@ -2899,7 +2899,7 @@ static int smack_socket_connect(struct socket *sock, struct sockaddr *sap,
>  #endif
>  #ifdef SMACK_IPV6_SECMARK_LABELING
>  	struct smack_known *rsp;
> -	struct socket_smack *ssp = sock->sk->sk_security;
> +	struct socket_smack *ssp;
>  #endif
>  
>  	if (sock->sk = NULL)
> @@ -2916,9 +2916,11 @@ static int smack_socket_connect(struct socket *sock, struct sockaddr *sap,
>  			return -EINVAL;
>  #ifdef SMACK_IPV6_SECMARK_LABELING
>  		rsp = smack_ipv6host_label(sip);
> -		if (rsp != NULL)
> +		if (rsp != NULL) {
> +			ssp = sock->sk->sk_security;
>  			rc = smk_ipv6_check(ssp->smk_out, rsp, sip,
>  						SMK_CONNECTING);
> +		}
>  #endif
>  #ifdef SMACK_IPV6_PORT_LABELING
>  		rc = smk_ipv6_port_check(sock->sk, sip, SMK_CONNECTING);


In the hope of reducing the ifdef forrest:
 you could move the struct smack_known *rsp; and struct socket_smack *ssp; into the block like:

{
	struct smack_known *rsp=smack_ipv6host_label(sip);
	
	if (rsp != NULL) {
		struct socket_smack *ssp= sock->sk->sk_security;
		rc = smk_ipv6_check(ssp->smk_out, rsp, sip,
  						SMK_CONNECTING);
		}
}


just my 2 cents ...

re,
 wh
