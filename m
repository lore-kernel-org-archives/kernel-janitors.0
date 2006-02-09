From: Andreas Mohr <andi@rhlx01.fht-esslingen.de>
Date: Thu, 09 Feb 2006 12:20:07 +0000
Subject: Re: [KJ] Correct imprecise >= comparisons
Message-Id: <20060209122006.GA22106@rhlx01.fht-esslingen.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============45658762900013006=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060208185312.GA26914@rhlx01.fht-esslingen.de>
In-Reply-To: <20060208185312.GA26914@rhlx01.fht-esslingen.de>
To: kernel-janitors@vger.kernel.org

--===============45658762900013006==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Thu, Feb 09, 2006 at 01:06:29AM +0100, Eric Sesterhenn wrote:
> hi,
> 
> > in the kernel source tree, there are several places (less important ones
> > and high-profile ones such as TCP/IP) which do "incorrect" checks such as:
> > 
> > if (val >= max)
> >   val = max;
> > 
> > which can instead be expressed as
> > 
> > if (val > max)
> >   val = max;
> >
> > in order to cut down on both executed cycles and cache write invalidation.
> 
> I am wondering if it is actually worth the effort, since it seems to
> me as if this would normally be an exception that val >= max. And
> instead of returning with an error or aborting you normalize the value.

It probably is unlikely in several cases, but that makes it all the more a
janitorial effort ;)
It's just "unclean" to set a variable's limit if it didn't even actually
step beyond the limit, which makes this more or less a janitorial task.

Andreas Mohr

--===============45658762900013006==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============45658762900013006==--
