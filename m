From: Matthew Wilcox <matthew@wil.cx>
Date: Tue, 25 Jan 2005 13:43:25 +0000
Subject: Re: [KJ] [PATCH] unified spinlock initialization
Message-Id: <20050125134325.GU31455@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============73861886781570352=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200501251704.22504.amitg@calsoftinc.com>
In-Reply-To: <200501251704.22504.amitg@calsoftinc.com>
To: Amit Gud <amitg@calsoftinc.com>
Cc: ralf@linux-mips.org, kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org, gud@eth.net

--===============73861886781570352==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 25, 2005 at 05:04:21PM +0530, Amit Gud wrote:
> Unify the spinlock initialization as far as possible.
> 
> Do consider applying.

Actually, 'handler' and 'lock' are initialised for you (see
kernel/irq/handle.c) so I think those two lines can just be deleted.
'action' is also initialised to NULL implicitly, so that can go.
I think setting 'status' and 'depth' like that is also unnecessary.

> Signed-off-by: Amit Gud <gud@eth.net>
> 
> --- orig/arch/mips/kernel/irq.c	2005-01-20 20:06:12.000000000 +0530
> +++ linux-2.6.11-rc2/arch/mips/kernel/irq.c	2005-01-25 15:29:35.000000000 +0530
> @@ -125,7 +125,7 @@ void __init init_IRQ(void)
>  		irq_desc[i].action  = NULL;
>  		irq_desc[i].depth   = 1;
>  		irq_desc[i].handler = &no_irq_type;
> -		irq_desc[i].lock = SPIN_LOCK_UNLOCKED;
> +		spin_lock_init(&irq_desc[i].lock);
>  	}
>  
>  	arch_init_irq();
> 

> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> http://lists.osdl.org/mailman/listinfo/kernel-janitors


-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain

--===============73861886781570352==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============73861886781570352==--
