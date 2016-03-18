From: Jarno Rajahalme <jarno@ovn.org>
Date: Fri, 18 Mar 2016 17:05:54 +0000
Subject: Re: [patch] openvswitch: using a bit shift as a mask
Message-Id: <D6F6A4E4-39BC-46F3-AF93-E71D6E309E42@ovn.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160317104136.GC3100@mwanda>
In-Reply-To: <20160317104136.GC3100@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Pravin Shelar <pshelar@nicira.com>, Pablo Neira Ayuso <pablo@netfilter.org>, dev@openvswitch.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


> On Mar 17, 2016, at 3:41 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> 
> The original condition is never true.  We want to test if BIT(0) is set
> but the code is ANDing with zero.
> 
> Fixes: 05752523e565 ('openvswitch: Interface with NAT.')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/net/openvswitch/conntrack.c b/net/openvswitch/conntrack.c
> index dc5eb29..29c82d6 100644
> --- a/net/openvswitch/conntrack.c
> +++ b/net/openvswitch/conntrack.c
> @@ -668,7 +668,7 @@ static int ovs_ct_nat(struct net *net, struct sw_flow_key *key,
> 	 */
> 	if (info->nat & OVS_CT_NAT && ctinfo != IP_CT_NEW &&
> 	    ct->status & IPS_NAT_MASK &&
> -	    (!(ct->status & IPS_EXPECTED_BIT) || info->commit)) {
> +	    (!(ct->status & IPS_EXPECTED) || info->commit)) {
> 		/* NAT an established or related connection like before. */
> 		if (CTINFO2DIR(ctinfo) = IP_CT_DIR_REPLY)
> 			/* This is the REPLY direction for a connection

Thanks for spotting this! Maybe it would be even better to use the test_bit() function, like this:

> +	    (!test_bit(IPS_EXPECTED_BIT, &ct->status) || info->commit)) {


  Jarno

