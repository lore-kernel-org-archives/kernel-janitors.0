From: Armin Schindler <armin@melware.de>
Date: Thu, 17 Mar 2005 15:47:48 +0000
Subject: Re: [KJ] [PATCH] printk : drivers/isdn/hardware/eicon/divasmain.c
Message-Id: <Pine.LNX.4.61.0503171645300.8775@phoenix.one.melware.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============73357971567695213=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050317150929.GQ2102@rhum.iomeda.fr>
In-Reply-To: <20050317150929.GQ2102@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org

--===============73357971567695213==
Content-Type: TEXT/PLAIN; charset=US-ASCII

Sorry, but I have to reject this.

This printk() line is the end of the line which is started with the previous
printk(). The initial printk() does have KERN_*, but does not end with '\n'.

Armin

On Thu, 17 Mar 2005, Christophe Lucas wrote:
> Hi,
> 
> Description:
> printk() calls should include appropriate KERN_* constant.
> 
> Have a nice day,
> 
> Signed-off-by: Christophe Lucas <clucas@rotomalug.org>
> 
> 

--===============73357971567695213==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============73357971567695213==--
