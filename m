From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sat, 18 Feb 2006 12:33:12 +0000
Subject: Re: [KJ][Patch] remove implicit sign bit in msp3400.h
Message-Id: <20060218123312.GA11481@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============80852527208601099=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1139380004.9409.40.camel@localhost.localdomain>
In-Reply-To: <1139380004.9409.40.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============80852527208601099==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 09, 2006 at 11:15:31PM +1100, Darren Jenkins" wrote:
> Weird if you ask me. I'm pretty sure the C standard says they are
> promoted to an int for calculations.

It's very logical.

	int a:1;

means 1 bit for sign (it's int) + >=1 bit for absolute value (it's int).
So, >=2 bits you should somehow fit into 1 bit.

	int	   |	unsigned int   |
-------------------+-------------------+---
doesn't make sense |	     OK	       |:1
	OK	   |	     OK	       |:2
	OK	   |	     OK	       |:3
			...

I guess C standard says "undefined behaviour" or "implementation-defined".

> But I suppose as it makes no
> difference it is better to stick with convention.

> --- linux-2.6.16-rc2/drivers/media/video/msp3400.h.orig
> +++ linux-2.6.16-rc2/drivers/media/video/msp3400.h
> @@ -86,8 +86,8 @@ struct msp_state {
>  	/* thread */
>  	struct task_struct   *kthread;
>  	wait_queue_head_t    wq;
> -	int                  restart:1;
> -	int                  watch_stereo:1;
> +	unsigned int         restart:1;
> +	unsigned int         watch_stereo:1;

Applied.

BTW, someone could do

	int a:1;
	if (a < 0)

so every time type is flipped, submitter should check every usage of "a".


--===============80852527208601099==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============80852527208601099==--
