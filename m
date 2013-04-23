From: Ralf Baechle <ralf@linux-mips.org>
Date: Tue, 23 Apr 2013 08:52:26 +0000
Subject: Re: [patch] netrom: info leak in ->getname()
Message-Id: <20130423085226.GB10781@linux-mips.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130423062251.GB15893@elgon.mountain>
In-Reply-To: <20130423062251.GB15893@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "David S. Miller" <davem@davemloft.net>, linux-hams@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Apr 23, 2013 at 09:22:51AM +0300, Dan Carpenter wrote:

> The sockaddr_ax25 struct has a 3 byte hole between ->sax25_call and
> ->sax25_ndigis.  I've added a memset to avoid leaking uninitialized
> stack data to userspace.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/net/netrom/af_netrom.c b/net/netrom/af_netrom.c
> index 103bd70..ec0c80f 100644
> --- a/net/netrom/af_netrom.c
> +++ b/net/netrom/af_netrom.c
> @@ -834,6 +834,8 @@ static int nr_getname(struct socket *sock, struct sockaddr *uaddr,
>  	struct sock *sk = sock->sk;
>  	struct nr_sock *nr = nr_sk(sk);
>  
> +	memset(&sax->fsa_ax25, 0, sizeof(struct sockaddr_ax25));
> +
>  	lock_sock(sk);
>  	if (peer != 0) {
>  		if (sk->sk_state != TCP_ESTABLISHED) {

Good catch.

Acked-by: Ralf Baechle <ralf@linux-mips.org>

  Ralf
