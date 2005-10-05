From: Matthew Wilcox <matthew@wil.cx>
Date: Wed, 05 Oct 2005 22:22:32 +0000
Subject: Re: [KJ] hexdigits definition consolidation [RESEND2]
Message-Id: <20051005222232.GH19437@parisc-linux.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============10804154661880849=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051005201210.GA27788@masoud.ir>
In-Reply-To: <20051005201210.GA27788@masoud.ir>
To: kernel-janitors@vger.kernel.org

--===============10804154661880849==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 06, 2005 at 01:21:25AM +0400, Alexey Dobriyan wrote:
> > +const char small_digits[] = "0123456789abcdefghijklmnopqrstuvwxyz";
> > +EXPORT_SYMBOL(small_digits);
> > +
> > +const char large_digits[] = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
> > +EXPORT_SYMBOL(large_digits);
> 
> I guess many people from linux-kernel will shoot us for exporting
> _this_.

I don't see why.  If we want to use it from modules, we need to export
it.

--===============10804154661880849==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============10804154661880849==--
