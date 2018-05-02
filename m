From: David Miller <davem@davemloft.net>
Date: Wed, 02 May 2018 14:19:43 +0000
Subject: Re: [PATCH] NET/netlink: optimize output of seq_puts in af_netlink.c
Message-Id: <20180502.101943.1124614050601030061.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180502095421.GA15014@yubo-2>
In-Reply-To: <20180502095421.GA15014@yubo-2>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: tsu.yubo@gmail.com
Cc: xiyou.wangcong@gmail.com, yuzibode@126.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Bo YU <tsu.yubo@gmail.com>
Date: Wed, 2 May 2018 05:54:24 -0400

> Optimization of command output: `cat /proc/net/netlink`
> 
> After the patch, we will get:
> 
> https://clbin.com/lnu4L
> 
> Signed-off-by: Bo YU <tsu.yubo@gmail.com>
> ---
>  net/netlink/af_netlink.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/net/netlink/af_netlink.c b/net/netlink/af_netlink.c
> index 55342c4d5cec..2e2dd88fc79f 100644
> --- a/net/netlink/af_netlink.c
> +++ b/net/netlink/af_netlink.c
> @@ -2606,13 +2606,13 @@ static int netlink_seq_show(struct seq_file
> *seq, void *v)
>  {
>  	if (v = SEQ_START_TOKEN) {
>  		seq_puts(seq,
> -			 "sk       Eth Pid    Groups   "
> -			 "Rmem     Wmem     Dump     Locks     Drops     Inode\n");
> +			 "sk               Eth Pid        Groups   "
> + "Rmem Wmem Dump Locks Drops Inode\n");

Please do not break the indentation of the code like this.

I wish to unfortunately say, that generally speaking, your patch
submissions are not of the best quality, and take up a lot of reviewer
time and resources as a result.

If you do not improve the quality of your submissions, I am giving
you a kind warning that the amount of care and review your patches
will receive will become lower.  Your submissions might even get to
the point wheere they are effectively ignored.

So please put more care into your work.

Thank you.
