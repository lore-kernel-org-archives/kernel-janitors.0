From: Julia Lawall <julia.lawall@inria.fr>
Date: Tue, 14 Jul 2020 14:16:15 +0000
Subject: Re: [PATCH] decnet: dn_dev: Remove an unnecessary label.
Message-Id: <alpine.DEB.2.22.394.2007141615490.2355@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200714141309.GA3184@blackclown>
In-Reply-To: <20200714141309.GA3184@blackclown>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Suraj Upadhyay <usuraj35@gmail.com>
Cc: davem@davemloft.net, kuba@kernel.org, linux-decnet-user@lists.sourceforge.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



On Tue, 14 Jul 2020, Suraj Upadhyay wrote:

> Remove the unnecessary label from dn_dev_ioctl() and make its error
> handling simpler to read.
>
> Signed-off-by: Suraj Upadhyay <usuraj35@gmail.com>
> ---
>  net/decnet/dn_dev.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/net/decnet/dn_dev.c b/net/decnet/dn_dev.c
> index 65abcf1b3210..64901bb9f314 100644
> --- a/net/decnet/dn_dev.c
> +++ b/net/decnet/dn_dev.c
> @@ -462,7 +462,9 @@ int dn_dev_ioctl(unsigned int cmd, void __user *arg)
>  	switch (cmd) {
>  	case SIOCGIFADDR:
>  		*((__le16 *)sdn->sdn_nodeaddr) = ifa->ifa_local;
> -		goto rarok;
> +		if (copy_to_user(arg, ifr, DN_IFREQ_SIZE))
> +			ret = -EFAULT;
> +			break;

The indentation on break does not look correct.

julia

>
>  	case SIOCSIFADDR:
>  		if (!ifa) {
> @@ -485,10 +487,6 @@ int dn_dev_ioctl(unsigned int cmd, void __user *arg)
>  	rtnl_unlock();
>
>  	return ret;
> -rarok:
> -	if (copy_to_user(arg, ifr, DN_IFREQ_SIZE))
> -		ret = -EFAULT;
> -	goto done;
>  }
>
>  struct net_device *dn_dev_get_default(void)
> --
> 2.17.1
>
>
