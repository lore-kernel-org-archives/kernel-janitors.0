From: "Stephen Biggs" <yrgrknmxpzlk@gawab.com>
Date: Tue, 15 Feb 2005 06:41:23 +0000
Subject: Re: [KJ] [PATCH][RESUBMIT][17/21] include/linux/* - compile warning
Message-Id: <4211B5B3.19272.158650@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============53247524767087018=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <42113C2D.26296.52C286@localhost>
In-Reply-To: <42113C2D.26296.52C286@localhost>
To: kernel-janitors@vger.kernel.org

--===============53247524767087018==
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body

On 14 Feb 2005 at 14:31, Greg KH wrote:

> On Tue, Feb 15, 2005 at 12:02:53AM +0200, Stephen Biggs wrote:
> > diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc3-mm2-original/include/linux/module.h linux-2.6.11-rc3-mm2/include/linux/module.h
> > --- linux-2.6.11-rc3-mm2-original/include/linux/module.h	2005-02-12 12:06:39.000000000 +0200
> > +++ linux-2.6.11-rc3-mm2/include/linux/module.h	2005-02-13 23:23:16.000000000 +0200
> > @@ -84,7 +84,10 @@ extern const struct gtype##_id __mod_##g
> >  extern struct module __this_module;
> >  #define THIS_MODULE (&__this_module)
> >  #else  /* !MODULE */
> > -#define MODULE_GENERIC_TABLE(gtype,name)
> > +#define MODULE_GENERIC_TABLE(gtype,name)			\
> > +extern const struct gtype##_id __not_mod_##name##_unused	\
> > +  __attribute__ ((unused, weak, alias(__stringify(name))))
> > +
> >  #define THIS_MODULE ((struct module *)0)
> >  #endif
> 
> Yeah, nice job with this.
> 
> But split it out into a separate patch (remember, one patch per
> individual "thing" you want to change.)

Done.

> 
> thanks,
> 
> greg k-h
> 




--===============53247524767087018==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============53247524767087018==--
