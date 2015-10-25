From: Marcel Holtmann <marcel@holtmann.org>
Date: Sun, 25 Oct 2015 19:54:04 +0000
Subject: Re: [PATCH 6/9] Bluetooth: btmrvl: add missing of_node_put
Message-Id: <B4A49D12-065C-4A05-8752-8A017617CF2A@holtmann.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1445697755-26341-1-git-send-email-Julia.Lawall@lip6.fr> <1445697755-26341-7-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1445697755-26341-7-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, "Gustavo F. Padovan" <gustavo@padovan.org>, Johan Hedberg <johan.hedberg@gmail.com>, linux-bluetooth <linux-bluetooth@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, Bjorn Helgaas <bhelgaas@google.com>, Jason Cooper <jason@lakedaemon.net>

Hi Julia,

> for_each_compatible_node performs an of_node_get on each iteration, so
> a break out of the loop requires an of_node_put.
> 
> A simplified version of the semantic patch that fixes this problem is as
> follows (http://coccinelle.lip6.fr):
> 
> // <smpl>
> @@
> expression e;
> local idexpression n;
> @@
> 
> for_each_compatible_node(n, ...) {
>   ... when != of_node_put(n)
>       when != e = n
> (
>   return n;
> |
> +  of_node_put(n);
> ?  return ...;
> )
>   ...
> }
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---
> drivers/bluetooth/btmrvl_main.c |    5 ++++-
> 1 file changed, 4 insertions(+), 1 deletion(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

