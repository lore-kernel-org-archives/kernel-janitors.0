From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 16 Jul 2020 10:23:22 +0000
Subject: Re: =?utf-8?B?562U5aSN?= =?utf-8?Q?=3A?= [PATCH v2] ipvs: clean code for ip_vs_sync.c
Message-Id: <20200716102321.GC2549@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1594864671-31512-1-git-send-email-zhouxudong8@huawei.com>
 <20200716024627.GC14742@blackclown>
 <69D1AB391AAC5746B9ECCF192D064D641A7949E1@DGGEMI521-MBX.china.huawei.com>
In-Reply-To: <69D1AB391AAC5746B9ECCF192D064D641A7949E1@DGGEMI521-MBX.china.huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Zhouxudong (EulerOS)" <zhouxudong8@huawei.com>
Cc: Suraj Upadhyay <usuraj35@gmail.com>, "wensong@linux-vs.org" <wensong@linux-vs.org>, "horms@verge.net.au" <horms@verge.net.au>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "lvs-devel@vger.kernel.org" <lvs-devel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "Chenxiang (EulerOS)" <rose.chen@huawei.com>, "Zhaowei (EulerOS)" <zhaowei23@huawei.com>

It's probably better to start somewhere like drivers/staging for clean
up work.  Networking people are pretty busy with their own things but
staging is happy to take clean up patches.

You need to use a proper legal name (like you would for signing
documents for your From and Signed-off-by.

> > @@ -1444,7 +1444,7 @@ static int bind_mcastif_addr(struct socket *sock, struct net_device *dev)
> >  	sin.sin_addr.s_addr  = addr;
> >  	sin.sin_port         = 0;
> 
> I think you missed this one.
> should be
> -        sin.sin_port         = 0;
> +	 sin.sin_port = 0

That was done deliberately.  Just leave that one as-is, please.

regards,
dan carpenter
