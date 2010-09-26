From: Dan Carpenter <error27@gmail.com>
Date: Sun, 26 Sep 2010 12:50:22 +0000
Subject: Re: [PATCH 1/1] bridge:rerouting after NAT
Message-Id: <20100926125022.GB6134@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <AANLkTi=cEH_48+5r32SuwGGHnM4+PTxxFmZ-aM9skkzL@mail.gmail.com>
In-Reply-To: <AANLkTi=cEH_48+5r32SuwGGHnM4+PTxxFmZ-aM9skkzL@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Mary,

Thank you for your patch.  There are some few details which need to be
changed and the patch resent.

1)  2.6.8 is way too old.  We don't have a ebt_nat_dst() function any
more.  Here is what the file looks like these days
http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=blob_plain;f=net/bridge/netfilter/ebtable_nat.c

2)  This patch needs to get sent to:
	ebtables-devel@lists.sourceforge.net
	netfilter-devel@vger.kernel.org
	bridge@lists.linux-foundation.org
	netdev@vger.kernel.org

3) Your email client is line wrapping the patch so it doesn't apply.
   Please read Documentation/email-clients.txt.
   Send the  patch to yourself and the check that it applies by saving
   it as a raw email with the headers and everything and then
   cat raw_email.txt | patch -p1
 
4) It needs a Signed-off-by line:
Signed-off-by: Your Name <email@address.com>

On Sun, Sep 26, 2010 at 02:28:01PM +0800, marywangran wrote:
> Hi,everyone
> 
> As we know,the NAT netfilter-hook for IP hooking at OUTPUT is called
> after routing,so we must rerouting if the destinaton or source address
> is changed by NAT after the hook.It's all right as the kernel shown
> for us.But I don't see any logic for rerouting after the
> bridged-NAT.If bridge-NAT changes a destination or source MAC
> address,we should do bridge-rerouting as the IP-layer do.
> I have only the kernel of version 2.6.8,so I patch on it.Thought the
> bridge-logic of kernel source of version 2.6.3X has not been
> changed,it's no matter to patch on kernel of version 2.6.8.
> 
> Best wishes
> 
> --- kernel-source-2.6.8/net/bridge/netfilter/ebtable_nat.c	2004-08-14
> 01:38:09.000000000 -0400
> +++ kernel-source-2.6.8/net/bridge/netfilter/ebtable_nat.c	2010-09-25
> 23:18:13.040825944 -0400
> @@ -10,6 +10,7 @@
> 
>  #include <linux/netfilter_bridge/ebtables.h>
>  #include <linux/module.h>
> +#include "../br_private.h"
> 
>  #define NAT_VALID_HOOKS ((1 << NF_BR_PRE_ROUTING) | (1 << NF_BR_LOCAL_OUT) | \
>     (1 << NF_BR_POST_ROUTING))
> @@ -61,6 +62,30 @@
>  };
> 
>  static unsigned int
> +ebt_nat_dst_local(unsigned int hook, struct sk_buff **pskb, const
> struct net_device *in
> +   , const struct net_device *out, int (*okfn)(struct sk_buff *))
      ^
this comma belongs on the previous line

> +{
> +	struct net_bridge *br = netdev_priv(out);
> +	struct net_bridge_fdb_entry *dst;
> +	char orig_mac[ETH_ALEN] = {0};
> +	unsigned int ret = 0;

put a blank line here (after the declarations and before the
statements).

> +	memcpy(orig_mac, ((**pskb).mac.ethernet)->h_dest, ETH_ALEN *
> sizeof(unsigned char));
  ^^^^^^^^^^^^^^^^^^^^^

Sizeof char is always 1 so this is not needed.  Just "ETH_ALEN" is enough.       

Thanks again for your patch.  Kernel-janitors mostly works on clean up
code and small bug fixes so we wouldn't know about these features of
netfilter but the other mailing lists I mentioned will know.

regards,
dan carpenter

> +	ret = ebt_do_table(hook, pskb, in, out, &frame_nat);
> +	if (strncmp(((**pskb).mac.ethernet)->h_dest, orig_mac, ETH_ALEN)) {
> +		rcu_read_lock();
> +		if ((((**pskb).mac.ethernet)->h_dest)[0] & 1)
> +			br_flood_deliver(br, *pskb, 0);
> +		else if ((dst = __br_fdb_get(br, ((**pskb).mac.ethernet)->h_dest)) != NULL)
> +			br_deliver(dst->dst, *pskb);
> +		else
> +			br_flood_deliver(br, *pskb, 0);
> +		rcu_read_unlock();
> +		return NF_STOLEN;
> +				
> +	}
> +	return ret;
> +}
> +static unsigned int
>  ebt_nat_dst(unsigned int hook, struct sk_buff **pskb, const struct
> net_device *in
>     , const struct net_device *out, int (*okfn)(struct sk_buff *))
>  {
> @@ -76,7 +101,7 @@
> 
>  static struct nf_hook_ops ebt_ops_nat[] = {
>  	{
> -		.hook		= ebt_nat_dst,
> +		.hook		= ebt_nat_dst_local,
>  		.owner		= THIS_MODULE,
>  		.pf		= PF_BRIDGE,
>  		.hooknum	= NF_BR_LOCAL_OUT,

