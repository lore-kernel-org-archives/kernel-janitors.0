From: Arnaldo Carvalho de Melo <acme@conectiva.com.br>
Date: Thu, 23 Sep 2004 22:27:25 +0000
Subject: [Kernel-janitors] Re: [PATCH 2.6.9-rc2 22/38] net/ltpc: replace
Message-Id: <41534DCD.3000800@conectiva.com.br>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040916234647.GI1777@us.ibm.com>
In-Reply-To: <20040916234647.GI1777@us.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Nishanth Aravamudan wrote:
> Any comments would be appreciated.

OK with me, as the other one for the cyc2x

> 
> Description: Use ssleep() / msleep() [as appropriate]
> instead of schedule_timeout() to guarantee the task delays as expected.
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
> 
> --- 2.6.9-rc2-vanilla/drivers/net/appletalk/ltpc.c	2004-09-13 17:15:44.000000000 -0700
> +++ 2.6.9-rc2/drivers/net/appletalk/ltpc.c	2004-09-14 17:11:33.000000000 -0700
> @@ -1109,8 +1109,7 @@ struct net_device * __init ltpc_probe(vo
>  	inb_p(io+1);
>  	inb_p(io+3);
>  
> -	set_current_state(TASK_UNINTERRUPTIBLE);
> -	schedule_timeout(2*HZ/100);
> +	msleep(20);
>  
>  	inb_p(io+0);
>  	inb_p(io+2);
> @@ -1120,8 +1119,7 @@ struct net_device * __init ltpc_probe(vo
>  	inb_p(io+5); /* enable dma */
>  	inb_p(io+6); /* tri-state interrupt line */
>  
> -	set_current_state(TASK_UNINTERRUPTIBLE);
> -	schedule_timeout(HZ);
> +	ssleep(1);
>  	
>  	/* now, figure out which dma channel we're using, unless it's
>  	   already been specified */
> 
> 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
