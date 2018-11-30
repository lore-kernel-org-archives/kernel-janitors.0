From: Simon Horman <simon.horman@netronome.com>
Date: Fri, 30 Nov 2018 14:13:21 +0000
Subject: Re: [PATCH] openvswitch: fix spelling mistake "execeeds" -> "exceeds"
Message-Id: <20181130141320.vudeegxkezadlxlp@netronome.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181127143717.27698-1-colin.king@canonical.com>
In-Reply-To: <20181127143717.27698-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Pravin B Shelar <pshelar@ovn.org>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, dev@openvswitch.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Nov 27, 2018 at 02:37:17PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a net_warn_ratelimited message, fix this.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Simon Horman <simon.horman@netronome.com>

> ---
>  net/openvswitch/conntrack.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/net/openvswitch/conntrack.c b/net/openvswitch/conntrack.c
> index a4660c48ff01..cd94f925495a 100644
> --- a/net/openvswitch/conntrack.c
> +++ b/net/openvswitch/conntrack.c
> @@ -1166,7 +1166,7 @@ static int ovs_ct_commit(struct net *net, struct sw_flow_key *key,
>  				&ct->tuplehash[IP_CT_DIR_ORIGINAL].tuple);
>  			if (err) {
>  				net_warn_ratelimited("openvswitch: zone: %u "
> -					"execeeds conntrack limit\n",
> +					"exceeds conntrack limit\n",
>  					info->zone.id);
>  				return err;
>  			}
> -- 
> 2.19.1
> 
