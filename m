From: Matthew Wilcox <matthew@wil.cx>
Date: Fri, 14 Oct 2005 11:46:19 +0000
Subject: Re: [KJ] [PATCH] Get rid of yield()
Message-Id: <20051014114619.GA16113@parisc-linux.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============87759331375142602=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051013191321.GA22138@masoud.ir>
In-Reply-To: <20051013191321.GA22138@masoud.ir>
To: kernel-janitors@vger.kernel.org

--===============87759331375142602==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 13, 2005 at 03:13:21PM -0400, Masoud Sharbiani wrote:
> Hello, 
> the following patch removes yield() from all drivers. They have been replaced by schedule_timeout() or cond_resched(). Please verify and comment.

You didn't even compile-test these, did you?

> diff --git a/drivers/net/depca.c b/drivers/net/depca.c
> --- a/drivers/net/depca.c
> +++ b/drivers/net/depca.c
> @@ -762,9 +762,7 @@ static int __init depca_hw_init (struct 
>  		/* Trigger an initialization just for the interrupt. */
>  		outw(INEA | INIT, DEPCA_DATA);
>  
> -		delay = jiffies + HZ/50;
> -		while (time_before(jiffies, delay))
> -			yield();
> +		schedule_timeout(HZ/50);
>  
>  		irqnum = probe_irq_off(irq_mask);
>  

This one adds a warning -- the delay variable is no longer used.


--===============87759331375142602==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============87759331375142602==--
