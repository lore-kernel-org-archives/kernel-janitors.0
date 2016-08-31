From: Florian Fainelli <f.fainelli@gmail.com>
Date: Wed, 31 Aug 2016 17:08:44 +0000
Subject: Re: [PATCH 3/6] net: bcmgenet: constify ethtool_ops structures
Message-Id: <c1bac795-eb18-c508-1ea1-ba199efcdf04@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1472628648-3603-1-git-send-email-Julia.Lawall@lip6.fr>
 <1472628648-3603-4-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1472628648-3603-4-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

On 08/31/2016 12:30 AM, Julia Lawall wrote:
> Check for ethtool_ops structures that are only stored in the ethtool_ops
> field of a net_device structure or passed as the second argument to
> netdev_set_default_ethtool_ops.  These contexts are declared const, so
> ethtool_ops structures that have these properties can be declared as const
> also.
> 
> The semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @r disable optional_qualifier@
> identifier i;
> position p;
> @@
> static struct ethtool_ops i@p = { ... };
> 
> @ok1@
> identifier r.i;
> struct net_device e;
> position p;
> @@
> e.ethtool_ops = &i@p;
> 
> @ok2@
> identifier r.i;
> expression e;
> position p;
> @@
> netdev_set_default_ethtool_ops(e, &i@p)
> 
> @bad@
> position p != {r.p,ok1.p,ok2.p};
> identifier r.i;
> @@
> i@p
> 
> @depends on !bad disable optional_qualifier@
> identifier r.i;
> @@
> static
> +const
>  struct ethtool_ops i = { ... };
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
