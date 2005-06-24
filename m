From: Mark Hollomon <markhollomon@comcast.net>
Date: Fri, 24 Jun 2005 13:23:06 +0000
Subject: Re: [KJ] [PATCH] time_after : drivers/net/apne.c
Message-Id: <42BC093A.4090704@comcast.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050624104540.GG5023@rhum.iomeda.fr>
In-Reply-To: <20050624104540.GG5023@rhum.iomeda.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Christophe Lucas wrote:
>
> @@ -216,7 +217,7 @@ static int __init apne_probe1(struct net
>  	outb(inb(ioaddr + NE_RESET), ioaddr + NE_RESET);
>  
>  	while ((inb(ioaddr + NE_EN0_ISR) & ENISR_RESET) = 0)
> -		if (jiffies - reset_start_time > 2*HZ/100) {
> +		if (time_after(jiffies, reset_start_time + 2*HZ/100)) {
>  			printk(" not found (no reset ack).\n");
>  			return -ENODEV;
>  		}

Wouldn't it be better to use msecs_to_jiffies(20) rather than explicit math on HZ?


-- 
Mark Hollomon
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
