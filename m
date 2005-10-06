From: Masoud Sharbiani <masouds@masoud.ir>
Date: Thu, 06 Oct 2005 15:42:26 +0000
Subject: Re: [KJ] hexdigits definition consolidation [RESEND2]
Message-Id: <20051006154226.GA1546@masoud.ir>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============16521224214293273=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051005201210.GA27788@masoud.ir>
In-Reply-To: <20051005201210.GA27788@masoud.ir>
To: kernel-janitors@vger.kernel.org

--===============16521224214293273==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 06, 2005 at 01:21:25AM +0400, Alexey Dobriyan wrote:
> On Wed, Oct 05, 2005 at 04:12:11PM -0400, Masoud Sharbiani wrote:
> > On Wed, Oct 05, 2005 at 11:25:33AM -0600, Matthew Wilcox wrote:
> > --- linux-2.6.clean/arch/cris/arch-v10/kernel/kgdb.c
> > +++ linux-2.6.patched/arch/cris/arch-v10/kernel/kgdb.c
> 
> Please, add "-p" to your diff(1) flags. It'd sometimes make reviewing
> much easier.
> 
> > @@ -557,8 +556,8 @@
> >  	char *sd;
> >  	int x = 0;
> >  	
> > -	for (s1 = (char*)s; (sd = gdb_cris_memchr(hexchars, *s1, base)) != NULL; ++s1)
> > -		x = x * base + (sd - hexchars);
> > +	for (s1 = (char*)s; (sd = gdb_cris_memchr(small_digits, *s1, base)) != NULL; ++s1)
> > +		x = x * base + (sd - small_digits);
> >          
> >          if (endptr)
> >          {
> 
> simple_strtol()

I think the reason that they have reimplemented these is that they want to have a separate function to avoid single stepping into the library functions and thus failing the kgdb. Same thing goes for reimplementations of strlen and other library functions in the same file.

cheers, 
Masoud 

--===============16521224214293273==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============16521224214293273==--
