From: Domen Puncer <domen@coderock.org>
Date: Mon, 28 Jun 2004 14:42:40 +0000
Subject: [Kernel-janitors] Re: check_region question
Message-Id: <20040628144240.GB24005@nd47>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============84965717449168654=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============84965717449168654==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 28/06/04 11:57 +0200, Carlo Perassi wrote:
> Hi
> compiling a new 2.6.7 I got
> drivers/ide/pci/trm290.c:376: warning: `check_region' is deprecated
> drivers/char/specialix.c:290: warning: `check_region' is deprecated
> 
> So I searched and found (see the end of the email) a lot of places where
> that call occours.
> I guess this is not (always) a "search/replace" task so my question is 
> 
> (a)
> if a call like
> check_region(s, n)
> should be replaced with
> request_region(s, n, name)
> (where name is something like hwif->name)
> and
> (b)
> if an if statement like
> if (check_region(s, n))
> should be replaced with
> if (!request_region(s, n, name))
> is there something more than ((a) + (b)) to convert a deprecated section
> of code?

It's not that simple.
There's been some recent discussion about this here, and i'm sure you
can find old check_region patches which were wrong, and a nice
description of what is wrong.

Basically, check_region() was used before request_region(), now you
have to check you didn't request a region that you shouldn't.
And that request_region() that was in code before usually get's removed.
(I hope i make some sense)

> I found some old patches which should be good examples but I don't know
> this topic enough to make a general theory.
> 
> Thanks.
> 
...
> sound/oss/waveartist.c:1349
> sound/oss/pss.c:191
...
Don't bother with these, they'll probably get removed in 2.7.x

--===============84965717449168654==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============84965717449168654==--
