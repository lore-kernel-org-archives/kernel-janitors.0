From: Pravin Shelar <pshelar@ovn.org>
Date: Thu, 09 Nov 2017 14:18:43 +0000
Subject: Re: [ovs-dev] [PATCH] openvswitch: add null pointer check on upcall
Message-Id: <CAOrHB_BmX=Rjo4V37y9z2QLQf1vNB5g5CyRhBY+DXiho5b3NSg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171109135943.418-1-colin.king@canonical.com>
In-Reply-To: <20171109135943.418-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Pravin Shelar <pshelar@nicira.com>, "David S . Miller" <davem@davemloft.net>, Linux Kernel Network Developers <netdev@vger.kernel.org>, ovs dev <dev@openvswitch.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Nov 9, 2017 at 7:29 PM, Colin King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> upcall may be assigned a NULL pointer as genlmsg_put can potentially
> return a NULL.  Add a null check to avoid a null pointer dereference
> on upcall.
>
> Detected by CoverityScan, CID#728404 ("Dereference null return value")
>
> Fixes: commit ccb1352e76cf ("net: Add Open vSwitch kernel components.")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  net/openvswitch/datapath.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/net/openvswitch/datapath.c b/net/openvswitch/datapath.c
> index 4d38ac044cee..e8fb3d76fa6e 100644
> --- a/net/openvswitch/datapath.c
> +++ b/net/openvswitch/datapath.c
> @@ -461,6 +461,10 @@ static int queue_userspace_packet(struct datapath *dp, struct sk_buff *skb,
>
>         upcall = genlmsg_put(user_skb, 0, 0, &dp_packet_genl_family,
>                              0, upcall_info->cmd);
> +       if (!upcall) {
> +               err = -ENOBUFS;
> +               goto out;
> +       }
user_skb is allocated according to all required attributes, so
genlmsg_put() can not return null value.


>         upcall->dp_ifindex = dp_ifindex;
>
>         err = ovs_nla_put_key(key, key, OVS_PACKET_ATTR_KEY, false, user_skb);
> --
> 2.14.1
>
> _______________________________________________
> dev mailing list
> dev@openvswitch.org
> https://mail.openvswitch.org/mailman/listinfo/ovs-dev
