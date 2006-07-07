From: "Randy.Dunlap" <rdunlap@xenotime.net>
Date: Fri, 07 Jul 2006 03:22:57 +0000
Subject: Re: [KJ] [PATCH] drivers/atm/nicstar.c: add KERN_* to printk
Message-Id: <20060706202257.cd2b4b3b.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <44ABCCD6.6060101@chello.nl>
In-Reply-To: <44ABCCD6.6060101@chello.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 7 Jul 2006 05:22:29 +0200 Richard wrote:

> Add KERN_* to printk statements
> 
> Signed-off-by: Richard van Berkum <h.vanberkum at chello.nl> 
> ---
> 
> Hopefully this one is ok. The previous patch was indeed reversed. I
> think the format is ok now since I use another mail client.
> 
> 
>  drivers/atm/nicstar.c |  126 ++++++++++++++++++++--------------------
>  1 file changed, 63 insertions(+), 63 deletions(-)

Yes, it now applies cleanly.

---
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
