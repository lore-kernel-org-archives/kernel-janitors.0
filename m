From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Sat, 15 Feb 2014 20:41:58 +0000
Subject: Re: [PATCH 2/3] staging: r8188eu: delete unnecessary field initialization
Message-Id: <20140215204158.GA15040@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1392449773-23429-2-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1392449773-23429-2-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Feb 15, 2014 at 08:36:12AM +0100, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> On success, the function netdev_alloc_skb initializes the dev field of its
> result to its first argument, so this doesn't have to be done in the
> calling context.
> 
> The semantic patch that fixes this problem is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> expression skb,privn,e;
> @@
> 
> skb = netdev_alloc_skb(privn,...);
> ... when strict
> (
> -skb->dev = privn;
> |
> ?skb = e
> )
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---
>  drivers/staging/rtl8188eu/hal/usb_ops_linux.c |    1 -
>  1 file changed, 1 deletion(-)

No longer applies to my tree :(

