From: Alexey Dobriyan <adobriyan@mail.ru>
Date: Thu, 03 Mar 2005 23:31:50 +0000
Subject: Re: [KJ] 2.6.11-kj
Message-Id: <200503040221.03211.adobriyan@mail.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050302095710.GA3745@nd47.coderock.org>
In-Reply-To: <20050302095710.GA3745@nd47.coderock.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thursday 03 March 2005 20:34, Nishanth Aravamudan wrote:

> Please let me know if it works and I'll push to LKML over the current KJ
> set.

It works. Neither gcc nor sparse complain now.

> --- 2.6.11-kj-v/drivers/cdrom/mcdx.c
> +++ 2.6.11-kj/drivers/cdrom/mcdx.c
> @@ -838,10 +838,10 @@ static void mcdx_delay(struct s_drive_st
>   *	May be we could use a simple count loop w/ jumps to itself, but
>   *	I wanna make this independent of cpu speed. [1 jiffy is 1/HZ] sec */
>  {
> +	DEFINE_WAIT(wait);
>  	if (jifs < 0)
>  		return;
>  
> -	DEFINE_WAIT(wait);
>  	xtrace(SLEEP, "*** delay: sleepq\n");
>  	prepare_to_wait(&stuff->sleepq, &wait, TASK_INTERRUPTIBLE);
>  	schedule_timeout(jifs);

	Alexey
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
