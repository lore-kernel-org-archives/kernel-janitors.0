From: YOSHIFUJI Hideaki / =?iso-2022-jp?B?GyRCNUhGIzFRTEAbKEI=?=
Date: Mon, 24 Dec 2007 15:29:00 +0000
Subject: Re: [PATCH 15/38] drivers/infiniband: Use time_before,
Message-Id: <20071225.002900.00703855.yoshfuji@linux-ipv6.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0712241528140.23999@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0712241528140.23999@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: julia@diku.dk
Cc: rolandd@cisco.com, mshefty@ichips.intel.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

In article <Pine.LNX.4.64.0712241528140.23999@ask.diku.dk> (at Mon, 24 Dec 2007 15:28:42 +0100 (CET)), Julia Lawall <julia@diku.dk> says:

> diff -r -u -p a/drivers/infiniband/hw/ipath/ipath_mad.c b/drivers/infiniband/hw/ipath/ipath_mad.c
> --- a/drivers/infiniband/hw/ipath/ipath_mad.c	2007-10-22 11:25:09.000000000 +0200
> +++ b/drivers/infiniband/hw/ipath/ipath_mad.c	2007-12-23 20:35:37.000000000 +0100
> @@ -1334,7 +1334,8 @@ static int process_subn(struct ib_device
>  	}
>  
>  	/* Is the mkey in the process of expiring? */
> -	if (dev->mkey_lease_timeout && jiffies >= dev->mkey_lease_timeout) {
> +	if (dev->mkey_lease_timeout &&
> +	    time_before_eq(jiffies, dev->mkey_lease_timeout)) {
>  		/* Clear timeout and mkey protection field. */
>  		dev->mkey_lease_timeout = 0;
>  		dev->mkeyprot = 0;

time_after_eq()

--yoshfuji
