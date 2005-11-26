From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sat, 26 Nov 2005 20:39:46 +0000
Subject: Re: [KJ][PATCH] linux-2.6.15-rc2 apm_emu.c audit misc_register() ret.
Message-Id: <20051126203946.GC30564@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============090113898366148915=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <34a7ae040511230009j20cff459r@mail.gmail.com>
In-Reply-To: <34a7ae040511230009j20cff459r@mail.gmail.com>
To: kernel-janitors@vger.kernel.org

--===============090113898366148915==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 24, 2005 at 08:32:01AM +0100, Christophe Lucas wrote:
> Paolo Teti (paolo.teti@gmail.com) wrote:
> > --- linux-2.6.15-rc2/drivers/macintosh/apm_emu.c.orig
> > +++ linux-2.6.15-rc2/drivers/macintosh/apm_emu.c
> > @@ -530,7 +530,11 @@ static int __init apm_emu_init(void)
> >  	if (apm_proc)
> >  		apm_proc->owner = THIS_MODULE;
> >
> > -	misc_register(&apm_device);
> > +	if (misc_register(&apm_device) != 0) {
> > +		remove_proc_entry("apm", NULL);
> > +		printk(KERN_ERR "apm_emu: Failed to register APM Emulation.\n");
> > +		return -ENODEV;
> > +	}

applied, thanks.

> >  	pmu_register_sleep_notifier(&apm_sleep_notifier);
>
>
> Good retry :)
>
> Already done here :
>
> 	http://lists.osdl.org/pipermail/kernel-janitors/2005-June/004243.html

[You sort your patch collection. Nothing happens.]

Speaking of your patch, it shouldn't use KERN_WARNING and should (minor
nitpick) test for "< 0", not "!= 0".


--===============090113898366148915==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============090113898366148915==--
