From: YOSHIFUJI Hideaki / =?iso-2022-jp?B?GyRCNUhGIzFRTEAbKEI=?=
Date: Mon, 24 Dec 2007 15:07:58 +0000
Subject: Re: [PATCH 31/38] net/decnet: Use time_before, time_before_eq, etc.
Message-Id: <20071225.000758.105456929.yoshfuji@linux-ipv6.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0712241547080.23999@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0712241547080.23999@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: julia@diku.dk
Cc: patrick@tykepenguin.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, yoshfuji@linux-ipv6.org

In article <Pine.LNX.4.64.0712241547080.23999@ask.diku.dk> (at Mon, 24 Dec 2007 15:47:32 +0100 (CET)), Julia Lawall <julia@diku.dk> says:

> From: Julia Lawall <julia@diku.dk>
> 
> The functions time_before, time_before_eq, time_after, and time_after_eq
> are more robust for comparing jiffies against other values.


> - jiffies >= E
> + time_after_eq(jiffies,E)


> diff -r -u -p a/net/decnet/af_decnet.c b/net/decnet/af_decnet.c
> --- a/net/decnet/af_decnet.c	2007-11-08 08:00:53.000000000 +0100
> +++ b/net/decnet/af_decnet.c	2007-12-23 20:30:40.000000000 +0100
:
> @@ -601,7 +602,7 @@ int dn_destroy_timer(struct sock *sk)
>  	if (sk->sk_socket)
>  		return 0;
>  
> -	if ((jiffies - scp->stamp) >= (HZ * decnet_time_wait)) {
> +	if (time_before_eq(jiffies, scp->stamp + HZ * decnet_time_wait)) {
>  		dn_unhash_sock(sk);
>  		sock_put(sk);
>  		return 1;

ugh?

> --- a/net/decnet/dn_timer.c	2006-11-30 19:05:46.000000000 +0100
> +++ b/net/decnet/dn_timer.c	2007-12-23 20:30:40.000000000 +0100
> @@ -21,6 +21,7 @@
>  #include <linux/netdevice.h>
>  #include <linux/timer.h>
>  #include <linux/spinlock.h>
> +#include <linux/jiffies.h>
>  #include <net/sock.h>
>  #include <asm/atomic.h>
>  #include <net/flow.h>
> @@ -96,7 +97,7 @@ static void dn_slow_timer(unsigned long 
>  	 * since the last successful transmission.
>  	 */
>  	if (scp->keepalive && scp->keepalive_fxn && (scp->state = DN_RUN)) {
> -		if ((jiffies - scp->stamp) >= scp->keepalive)
> +		if (time_before_eq(jiffies, scp->stamp + scp->keepalive))
>  			scp->keepalive_fxn(sk);
>  	}
>  

ugh?

--yoshfuji
