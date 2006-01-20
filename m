From: =?ISO-8859-1?Q?H=E5kon_L=F8vdal?= <hlovdal@gmail.com>
Date: Fri, 20 Jan 2006 02:19:34 +0000
Subject: Re: [KJ] [PATCH 2/5] README: Remove a.out reference
Message-Id: <a01a16b50601191819i30b16f1dm340b3cbf0ed76248@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a01a16b50601191210g7bb0b4d6uca221f09b33b4a6a@mail.gmail.com>
In-Reply-To: <a01a16b50601191210g7bb0b4d6uca221f09b33b4a6a@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On 1/19/06, Matthew Wilcox <matthew@wil.cx> wrote:
> On Thu, Jan 19, 2006 at 09:10:29PM +0100, H?kon L?vdal wrote:
> > Removed a line promising that users still could run a.out user programs.
> > As far as I know all distributions have removed libc.4 support years
> > ago, so while the kernel itself still might support a.out, the promise
> > is both 1) not needed anymore and 2) most likely not correct.
>
> Don't be silly.  Some people still use libc4, as well as old binaries
> which are statically linked.
>

The above was a very poor attempt of saying that nobody needs that line
(anymore). Let me try to clarify.

I am not suggesting removal of a.out support from the kernel.
I am suggesting removal of this line from the README file.

Yes the content of the line is still true, but what value does it have?

The kernel has supported running a.out binaries (while the kernel itself
is elf) for around a decade. Everybody that still uses a.out knows this.

The kernel support for a.out is controlled by and documented with the
config flag BINFMT_AOUT (or IA32_AOUT or BINFMT_AOUT32).
Why should the README file mention anything about a.out?

The line does not provide new information to anyone and is at best
redundant information. At worst it causes information overload or
confusion. Therefore I think it should be removed.

To view this from the opposite situation, if this line was not present
in the current kernel, why would you then add it and for whom would it
provide useful information?

BR H=E5kon L=F8vdal

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
