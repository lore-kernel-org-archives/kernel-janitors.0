From: Nish Aravamudan <nish.aravamudan@gmail.com>
Date: Sat, 26 Feb 2005 05:43:35 +0000
Subject: Re: [KJ] [PATCH] arch/i386/kernel/acpi/boot.c
Message-Id: <29495f1d05022521431b33dcea@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============25401065315304461=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <7a4211f805022518082a5c12a4@mail.gmail.com>
In-Reply-To: <7a4211f805022518082a5c12a4@mail.gmail.com>
To: kernel-janitors@vger.kernel.org

--===============25401065315304461==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 25 Feb 2005 21:08:47 -0500, Jonathan Stafford
<thecabinet@gmail.com> wrote:
> I've never done any kernel work before, but the gcc 4 warning fixes
> seems like a fairly easy place to start.  As there will ultimately be
> several hundred patches, is there are particular order to fix these?
> I've been tinkering with them simply in compiled order.
> 
> Should I be sending/cc'ing these patches to somewhere besides KJML as
> I write them?  I know that many of the various parts have their own
> mailings lists, but I don't begin to know what all of them are.  What
> about trivial patch monkey?

For these, it may be useful to directly paste the warning you are
fixing rather than referencing a URL. Or at least be a little more
detailed as why gcc 4 complains, so that more experienced devs may be
able to comment directly on the gcc 4 changes.

As far as knowing subsystem lists, just go by MAINTAINERS (it's in the
root dir of kernel source).

> Here's my first would-be patch; anything I should change?

At least in reply, it looks like spaces became tabs, but maybe that is
just GMail's reply. I am just surprised you were able to get GMail to
protect tabs. You were able to apply the inlined patch on your system
(the one from the E-mail, not necessarily the only you inlined).

I haven't messed with gcc 4, but I can trust your ability to read
warnings and correct them intelligently :) Seems ok to me.

-Nish

--===============25401065315304461==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============25401065315304461==--
