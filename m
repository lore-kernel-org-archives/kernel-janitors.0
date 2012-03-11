From: "Chas Williams (CONTRACTOR)" <chas@cmf.nrl.navy.mil>
Date: Sun, 11 Mar 2012 20:58:11 +0000
Subject: Re: [PATCH 5/7] drivers/atm/eni.c: ensure arguments to request_irq and free_irq are compatible
Message-Id: <201203112058.q2BKwBCS024617@cmf.nrl.navy.mil>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <1331494587-12196-6-git-send-email-Julia.Lawall@lip6.fr>
References: <1331494587-12196-6-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1331494587-12196-6-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

i am pretty sure that request_irq() shouldnt be changed but rather
free_irq() changed.  the last argument of request_irq() is passed to the
interrupt routine (ent_int in this case).  if you change that you need
to update the interrupt routine.  fixing free_irq would be easier.

In message <1331494587-12196-6-git-send-email-Julia.Lawall@lip6.fr>,Julia Lawall writes:
>Convert call to request_irq so that the last argument is the same as the
>second argument of the subsequent call to free_irq.  Without this
>property, free_irq does nothing.
>
>I have chosen to keep the call to free_irq as is, because its second
>argument is more like its first argument.
