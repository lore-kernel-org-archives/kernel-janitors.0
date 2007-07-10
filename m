From: "pradeep singh" <pradeep.rautela@gmail.com>
Date: Tue, 10 Jul 2007 06:19:01 +0000
Subject: Re: BLK question
Message-Id: <a901b49a0707092307q1e5935bbx69f44327e60ce9d5@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070710021217.GB19502@motherbox.xtechq.com.ar>
In-Reply-To: <20070710021217.GB19502@motherbox.xtechq.com.ar>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 7/10/07, Diego Woitasen <diego@woitasen.com.ar> wrote:
>
> Hi,
>         I want to know is BLK is really deprecated. I see that is used
>         in many places in the kernel, but the comments in the blk code
>         say "Don't use in new code".
deprecated not completely removed fully AFAICS.
It should go in near future.
You are not supposed to use BKL anymore i guess.

I am not the best person to ans that though :-/.

thanks
--pradeep
>
>         For example, reading the driver/pci/syscall.c I see that
>         sys_pciconfig_write() and sys_pciconfig_read() use it to control
>         the concurrency between these calls. Could this
>         lock_kernel()/unlock_kernel() be replaced by a local mutex?
>
>         regards,
>                 diegows
>
> --
>
> --------------
> Diego Woitasen
> -
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


-- 
Pradeep
