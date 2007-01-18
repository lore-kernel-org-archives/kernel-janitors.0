From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Thu, 18 Jan 2007 19:46:29 +0000
Subject: Re: [KJ] a quick and dirty doc fixup job, if someone wants it
Message-Id: <Pine.LNX.4.64.0701181445560.10988@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="0-1232186888-1169149560=:10988"
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701181101350.21156@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0701181101350.21156@CPE00045a9c397f-CM001225dbafb6>
To: kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--0-1232186888-1169149560=:10988
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-ID: <Pine.LNX.4.64.0701181446051.10988@CPE00045a9c397f-CM001225dbafb6>

On Thu, 18 Jan 2007, H=E5kon L=F8vdal wrote:

> On 18/01/07, Robert P. J. Day <rpjday@mindspring.com> wrote:
> > 1) Absolutely minimal software requirements for building the kernel,
> > along with their version numbers:
> >
> >         - gcc
> >         - GNU make
> >         - binutils
> >         - ...
>
> It would also be nice if tests for these were integrated and
> moved into the makefile (or test scripts called from the makefile).
>
> The following is a very naive and incomplete test for gcc version
> but you get the idea:
>
> gcc_version=3D`gcc --version | sed -n '1s/.*(GCC) \([^ ]*\) .*/\1/p'`
> case $gcc_version

or just "gcc -dumpversion".  :-)  but your point is well taken.

rday
--0-1232186888-1169149560=:10988
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--0-1232186888-1169149560=:10988--
