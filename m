From: maximilian attems <janitor@sternwelten.at>
Date: Thu, 14 Oct 2004 22:28:59 +0000
Subject: Re: [KJ] new janitor info
Message-Id: <20041014222859.GG3662@stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============64897113653933358=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1097793530.5995.47.camel@pdp11.tsho.org>
In-Reply-To: <1097793530.5995.47.camel@pdp11.tsho.org>
To: kernel-janitors@vger.kernel.org

--===============64897113653933358==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, 15 Oct 2004, Daniele Pizzoni wrote:

> Hello!
> 
> I'd like to start doing some work as janitor, I'm not exactly an
> absolute kernel newbie (some simple driver hacking experience), but I'd
> like to start with simple things just to start getting involved.
> 
> I had a look at the TODO list on janitor.kernelnewbies.org. I think I
> could to start with something from the following list:
> 
> ----8<--------8<--------8<--------8<--------8<--------8<----
> 
> From: Andrey Panin <pazke at orbita dot don dot sitek dot net>
> 
> - check printk() calls (should include appropriate KERN_* constant).

is always appreciated.
 
> ------------------------------------------------------------------------
> >From Domen Puncer:
> - pr_debug() from kernel.h could replace a lot of DPRINTK and similar macros.
> - same for pr_info()

lots of open cases.
 
> ------------------------------------------------------------------------
> >From Domen Puncer:
> - min/max macros from kernel.h are safe, a lot of handcrafted MIN/MAX are not.

some work done, you might want to coordinate with
Michael Veeck <michael.veeck@gmx.net> first taker
and also Clemens Buchacher <drizzd@aon.at>
 
> ------------------------------------------------------------------------
> >From Domen Puncer:
> - remove string concatenation with __FUNCTION__ (get rid of
> warnings, and get ready for __func__):
> -printk(KERN_INFO "blabla " __FUNCTION__ "\n");
> +printk(KERN_INFO "blabla %s\n", __FUNCTION__);
> 
> However, do not convert _FUNCTION_ to _func_ because older
> gcc versions do not support _func_.

these is mostly done, you let get a drink for finding one,
with latest kjt patchset applied.
anyway i'm kidding.
 
> ----8<--------8<--------8<--------8<--------8<--------8<----
> 
> 
> Anyway I'd like to know if the someone is already working on the same
> topics.
> 
> Also, are patches to be sent to the kernel-janitors list only?

that's up to you, if you'll find an MAINTAINER entry to the driver
you are free to cc him.

the kjt patchset pick all the good patches that were send to the
mailinglist and that are not yet merged by linus to push them
upstream.
 
> Thanks for you help, beware of the many questions I'm going to ask you!
> :)

hope that helps, and happy to read your patches soon. ;-)

--
maks
kernel janitor  	http://janitor.kernelnewbies.org/


--===============64897113653933358==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============64897113653933358==--
