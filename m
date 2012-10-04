From: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>
Date: Thu, 04 Oct 2012 00:52:05 +0000
Subject: Re: [PATCH 16/20] drivers/net/ethernet/renesas/sh_eth.c: fix error return code
Message-Id: <506CDDB5.5080508@renesas.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1349281090-10013-15-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1349281090-10013-15-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: 7bit
To: Peter Senna Tschudin <peter.senna@gmail.com>
Cc: davem@davemloft.net, kernel-janitors@vger.kernel.org, yoshihiro.shimoda.uh@renesas.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Peter Senna Tschudin さんは書きました:
> From: Peter Senna Tschudin <peter.senna@gmail.com>
> 
> Convert a nonnegative error return code to a negative one, as returned
> elsewhere in the function.
> 
> A simplified version of the semantic match that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> (
> if@p1 (\(ret < 0\|ret != 0\))
>  { ... return ret; }
> |
> ret@p1 = 0
> )
> ... when != ret = e1
>     when != &ret
> *if(...)
> {
>   ... when != ret = e2
>       when forall
>  return ret;
> }
> // </smpl>
> 
> Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>

Acked-by: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>
