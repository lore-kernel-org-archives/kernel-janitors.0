From: Alexander Aring <alex.aring@gmail.com>
Date: Wed, 11 Mar 2015 18:17:04 +0000
Subject: Re: [PATCH 13/15] ieee802154: don't export static symbol
Message-Id: <20150311181700.GA23342@omega>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1426092997-30605-1-git-send-email-Julia.Lawall@lip6.fr>
 <1426092997-30605-14-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1426092997-30605-14-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, linux-wpan@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, daniel@iogearbox.net, marcel@holtmann.org

On Wed, Mar 11, 2015 at 05:56:35PM +0100, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
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

Acked-by: Alexander Aring <alex.aring@gmail.com>

Marcel can you please queue this into bluetooth-next, or even bluetooth?

Thanks.

- Alex
