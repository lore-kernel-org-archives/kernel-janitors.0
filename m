From: Matthew Wilcox <matthew@wil.cx>
Date: Tue, 21 Jun 2005 21:09:04 +0000
Subject: Re: [KJ] [PATCH] Audit return code : drivers/input/misc/hp_sdc_rtc.c
Message-Id: <20050621210904.GB5200@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============53910960039203148=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050621101313.GE4880@rhum.iomeda.fr>
In-Reply-To: <20050621101313.GE4880@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org

--===============53910960039203148==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 21, 2005 at 11:24:50PM +0400, Alexey Dobriyan wrote:
> On Tuesday 21 June 2005 14:16, Christophe Lucas wrote:
> > Audit return codes (and handle failure correctly) for misc_register.
> 
> > --- 2.6.12-orig/drivers/input/misc/hp_sdc_rtc.c
> > +++ 2.6.12/drivers/input/misc/hp_sdc_rtc.c
> > @@ -702,7 +702,10 @@ static int __init hp_sdc_rtc_init(void)
> >  
> >  	if ((ret = hp_sdc_request_timer_irq(&hp_sdc_rtc_isr)))
> >  		return ret;
> > -	misc_register(&hp_sdc_rtc_dev);
> > +	if (ret = misc_register(&hp_sdc_rtc_dev)) {
> 
> hp_sdc_request_timer_irq() have hp_sdc_release_timer_irq() counterpart.
> Double brackets, please. Otherwise gcc will warn. Ditto for other patches.

In fact, don't do an assignment inside an if.  Ever.

	ret = misc_register(&hp_sdc_rtc_dev);
	if (ret) ...

is much clearer.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain

--===============53910960039203148==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============53910960039203148==--
