From: David Miller <davem@davemloft.net>
Date: Thu, 03 May 2018 16:58:00 +0000
Subject: Re: [PATCH V2] net/netlink: optimize seq_puts and seq_printf in af_netlink.c
Message-Id: <20180503.125800.805006461069190790.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180503090901.35bxgzs2tjsl7bqr@debian>
In-Reply-To: <20180503090901.35bxgzs2tjsl7bqr@debian>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: tsu.yubo@gmail.com
Cc: xiyou.wangcong@gmail.com, yuzibode@126.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: YU Bo <tsu.yubo@gmail.com>
Date: Thu, 3 May 2018 05:09:04 -0400

> Before the patch, the command `cat /proc/net/netlink` will output
> like:
> 
> https://clbin.com/BojZv
> 
> After the patch:
> 
> https://clbin.com/lnu4L
> 
> The optimization will make convenience for using `cat
> /proc/net/netlink`
> But,The checkpatch will give a warning:
> 
> WARNING: quoted string split across lines
> 
> Signed-off-by: Bo YU <tsu.yubo@gmail.com>

Please do not reference external web sites for text which explains
the change in your commit message.

Simply show the /proc/net/netlink headers and then one line of the
output, before and after, in diff style.

Then it will be clear to the reader that you are not "optimizing"
anything.  This is not an optimization.

You are just making sure the headers line up properly with the
actual value output.

Thank you.
