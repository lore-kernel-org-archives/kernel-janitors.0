From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Sun, 09 Oct 2005 05:08:13 +0000
Subject: Re: [KJ] Question re make
Message-Id: <20051009050813.GD5972@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============91924351353829903=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200510081802.35521.lkml@oxley.org>
In-Reply-To: <200510081802.35521.lkml@oxley.org>
To: kernel-janitors@vger.kernel.org

--===============91924351353829903==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 08.10.2005 [20:08:03 +0100], Felix Oxley wrote:
> 
> > You are "make"ing an object file, not a .c file. Makefiles' syntax is
> > for the target, not the source.
> >
> > make drivers/telephony/ixj.o
> >
> I had tried this all ready and forgot to mention it, but it didn't work at the 
> time.

Were you trying to build ixj as a module? You might have needed

make drivers/telephony/ixj.ko

Not sure, though.

> > Please read the Makefile before posting.
> >
> Which file should I read?

The top-level Makefile gives a good overview of available
targets/syntax. The drivers/telephony/Makefile probably has some
indication of available targets specific to that directory.

> > make M=drivers/telephony
> >
> 
> This does the trick!

Great!

> > > and
> > >         # cc driver/telephony/ixj.cjust gives hundreds of errors.
> >
> > This is just plain silly and why we have a Makefile system in the first
> > place.
> >
> I know, but  I was just trying to exaplan all the methods I had tried.
> I think I must have cocked something up before but it is better now.

Glad you got it figured out.

Thanks,
Nish

--===============91924351353829903==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============91924351353829903==--
