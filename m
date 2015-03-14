From: Marcel Holtmann <marcel@holtmann.org>
Date: Sat, 14 Mar 2015 16:13:26 +0000
Subject: Re: [PATCH 13/15] ieee802154: don't export static symbol
Message-Id: <9174D8D8-5176-4B98-8A3D-DE09B9C42612@holtmann.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1426092997-30605-1-git-send-email-Julia.Lawall@lip6.fr> <1426092997-30605-14-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1426092997-30605-14-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Alexander Aring <alex.aring@gmail.com>, kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, linux-wpan@vger.kernel.org, netdev <netdev@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, daniel@iogearbox.net

Hi Julia,

> The semantic patch that fixes this problem is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @r@
> type T;
> identifier f;
> @@
> 
> static T f (...) { ... }
> 
> @@
> identifier r.f;
> declarer name EXPORT_SYMBOL;
> @@
> 
> -EXPORT_SYMBOL(f);
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---
> net/ieee802154/nl-mac.c |    1 -
> 1 file changed, 1 deletion(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

