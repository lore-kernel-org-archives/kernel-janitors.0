From: Matt Helsley <matthltc@us.ibm.com>
Date: Tue, 28 Mar 2006 23:29:51 +0000
Subject: Re: [KJ] Re: [PATCH] bug fix to include/linux/cn_proc.h for 2.6.16-rc5
Message-Id: <1143588591.12783.9.camel@stark>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============14181664230798074=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1142312124.24621.82.camel@stark>
In-Reply-To: <1142312124.24621.82.camel@stark>
To: kernel-janitors@vger.kernel.org

--===============14181664230798074==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2006-03-16 at 10:44 -0800, Nishanth Aravamudan wrote:
> On 16.03.2006 [09:56:13 -0800], Narasimha Sharoff wrote:
> > If time.h need not be included in cn_proc.h, is there
> > a reason not to apply this patch?
> 
> This only applies if there is no reason to include it *in the kernel*.
> The fact that it breaks an (arbitrary) userspace build is irrelevant (at
> least as far as KJ is concerned).
> 
> > As i see, not having time.h in cn_proc.h resolves user space problem i
> > am seeing. Kernel compilation seems to go ok (tried it on a ppc
> > system,2.6.16-rc5).
> 
> I would suggest giving the kernel side justification only, then, as
> uerspace should not be using kernel headers directly anyways.
> 
> > I do not know how the header files end up in /usr/include/linux
> > directory. Is there a standard process followed while packaging or is
> > this distro specific? Can someone forward me a pointer?
> 
> Distro specific, there's probably a package you can find that put the
> header there (apt-file search filename or dpkg -S filename can help on
> Debian-based distros). I would figure out why it's there (and if it
> should be). Complain to the connector folks about it, as well (or just
> bring it to their attention).
> 
> Thanks,
> Nish

	OK, I looked into it and the #include <time.h> is cruft leftover from
an attempt to add a nanosecond-scale timestamp function to the kernel. I
eventually stopped pushing that patch because I found a suitable
replacement however I accidentally left #include<time.h> in cn_proc.h

	I'll run some compile-tests with Narasimha's patch and then Ack it
assuming it doesn't break compilation.

Cheers,
	-Matt Helsley


--===============14181664230798074==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============14181664230798074==--
