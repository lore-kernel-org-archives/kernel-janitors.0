From: Amit Choudhary <amit2030@yahoo.com>
Date: Tue, 17 Oct 2006 06:33:50 +0000
Subject: Re: [KJ] [PATCH 2.6.19-rc2] drivers/usb/serial/mos7840.c: check
Message-Id: <20061017063350.15913.qmail@web55611.mail.re4.yahoo.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20061015225513.f35312ec.amit2030@gmail.com>
In-Reply-To: <20061015225513.f35312ec.amit2030@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org




> > @@ -475,6 +475,14 @@ static int mos7840_get_reg(struct moschi
> >  	int ret = 0;
> >  	buffer = (__u8 *) mcs->ctrl_buf;
> >  
> > +	/* The memory for ctrl_buf is allocated in
> > +	 * mos7840_startup(), but it is not checked if
> > +	 * kmalloc failed. So, mcs->ctrl_buf might be NULL.
> > +	 * So, it should be checked here.
> > +	 */
> > +	if (!buffer)
> > +		return -ENOMEM;
> 
> Why not just check it in the startup function instead?

After looking at the code, I inferred that it can still proceed if ctrl_buf is NULL because
ctrl_buf is referenced only in mos7840_get_reg(). But please let me know if this is not the right
way.



__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
