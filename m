From: Julia Lawall <julia.lawall@lip6.fr>
Date: Thu, 03 May 2018 09:44:33 +0000
Subject: Re: [PATCH V2] net/netlink: optimize seq_puts and seq_printf in af_netlink.c
Message-Id: <alpine.DEB.2.20.1805031142420.3385@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180503090901.35bxgzs2tjsl7bqr@debian>
In-Reply-To: <20180503090901.35bxgzs2tjsl7bqr@debian>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YU Bo <tsu.yubo@gmail.com>
Cc: davem@davemloft.net, xiyou.wangcong@gmail.com, yuzibode@126.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org



On Thu, 3 May 2018, YU Bo wrote:

> Before the patch, the command `cat /proc/net/netlink` will output like:
>
> https://clbin.com/BojZv
>
> After the patch:
>
> https://clbin.com/lnu4L
>
> The optimization will make convenience for using `cat /proc/net/netlink`
> But,The checkpatch will give a warning:
>
> WARNING: quoted string split across lines

The interest of the checkpatch warning is that someone may want to grep
for something that has actually been split over two lines.  If this is not
an issue in your case and if there are good reasons for splitting the
string, then you can ignore checkpatch.

julia

>
> Signed-off-by: Bo YU <tsu.yubo@gmail.com>
> ---
> Changes in v2:
> Do not break the indentation of the code line
> ---
> net/netlink/af_netlink.c | 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/net/netlink/af_netlink.c b/net/netlink/af_netlink.c
> index 55342c4d5cec..2e2dd88fc79f 100644
> --- a/net/netlink/af_netlink.c
> +++ b/net/netlink/af_netlink.c
> @@ -2606,13 +2606,13 @@ static int netlink_seq_show(struct seq_file *seq, void
> *v)
> {
> 	if (v = SEQ_START_TOKEN) {
> 		seq_puts(seq,
> -			 "sk       Eth Pid    Groups   "
> -			 "Rmem     Wmem     Dump     Locks     Drops
> Inode\n");
> +			 "sk               Eth Pid        Groups   "
> +			 "Rmem     Wmem     Dump  Locks    Drops    Inode\n");
> 	} else {
> 		struct sock *s = v;
> 		struct netlink_sock *nlk = nlk_sk(s);
>
> -		seq_printf(seq, "%pK %-3d %-6u %08x %-8d %-8d %d %-8d %-8d
> %-8lu\n",
> +		seq_printf(seq, "%pK %-3d %-10u %08x %-8d %-8d %-5d %-8d %-8d
> %-8lu\n",
> 			   s,
> 			   s->sk_protocol,
> 			   nlk->portid,
> --
> 2.11.0
>
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
