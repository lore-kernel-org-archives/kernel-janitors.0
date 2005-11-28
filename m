From: Christophe Lucas <clucas@rotomalug.org>
Date: Mon, 28 Nov 2005 11:25:20 +0000
Subject: Re: [KJ][PATCH] linux-2.6.15-rc2 apm_emu.c audit misc_register() ret.
Message-Id: <20051128112520.GA8272@rotomalug.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============0020662254271366365=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <34a7ae040511230009j20cff459r@mail.gmail.com>
In-Reply-To: <34a7ae040511230009j20cff459r@mail.gmail.com>
To: kernel-janitors@vger.kernel.org

--===============0020662254271366365==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Paolo Teti (paolo.teti@gmail.com) wrote:
> > Speaking of your patch, it shouldn't use KERN_WARNING and should (minor
> > nitpick) test for "< 0", not "!= 0".
> >
> >
> 
> Why?
> Looking at misc_register function the rule is
> 
> "A zero is returned on success and a negative errno code for failure."
> 
> So test for !=0 is also correct!!
> 
> Sorry probably because I have used Ccr instead of Cc I have also sent this patch
> to Benjamin Herrenschmidt ( the ppc APM manteiner) and now this patch
> is on the -mm
> tree as show below!
> 
> Sorry!!
 
You don't have to be sorry. It is about my patch Alexey say that.

I understand your reply Alexey. I would have prefered to know that in
July 2005 not in November 2005.

Have a nice day,

				- Christophe (clucas@rotomalug.org)


--===============0020662254271366365==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============0020662254271366365==--
