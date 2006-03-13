From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Mon, 13 Mar 2006 12:39:02 +0000
Subject: Re: [KJ] Clarifying process for submitting a patch
Message-Id: <20060313123902.GB1197@neon.tklauser.home>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============32242239336813716=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060313000717.GA19862@morgase.caliginous.net>
In-Reply-To: <20060313000717.GA19862@morgase.caliginous.net>
To: kernel-janitors@vger.kernel.org

--===============32242239336813716==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2006-03-13 at 01:07:17 +0100, Dale Sedivec <dale-keyword-kerneljanitors.5631dd@codefu.org> wrote:
> 1. Do I or don't I include the kernel version being patched against?
>    Documentation/SubmittingPatches says to,
>    http://www.zip.com.au/~akpm/linux/patches/stuff/tpp.txt (4b) says
>    not to.  Should I include the version in the subject line, as
>    specified in http://linux.yyz.us/patch-format.html?  I don't see
>    anyone on k-j doing this.

It generally is a good idea to mention the version you're patching
against somewhere. For most of the people the diff-lines contain this
information e.g.

	--- linux-2.6.16-rc6.orig/some/file.c	2005-11-20 13:27:41.000000000 +0100
	+++ linux-2.6.16-rc6/some/file.c	2005-11-22 22:37:53.000000000 +0100

> 2. In general, who should I send to when submitting patches for k-j
>    items?  Possibilities apparently include:
> 
>    * kernel-janitors@lists.osdl.org

Of course :-)

>    * The driver maintainer
>    * The subsystem maintainer
>    * The subsystem mailing list

If you want to or feel confident enough, respectively. Just check the
MAINTAINERS file for the maintainer in charge of the code you're
changing.

>    * LKML
>    * Trivial patch monkey

Possibly yes.

>    Which of these should I send to?  Obviously only "trivial" patches
>    get send to trivial patch monkey.  I see some people on k-j Cc'ing
>    LKML, but some others don't.

That's up to you.

> 3. I believe I read that it's good to submit a small patch to k-j
>    first to see if it works.  Should that be sent _only_ to k-j?  If
>    so, and if no one brings up any problems with the format of the
>    patch on k-j, am I then supposed to resend that patch to some/all
>    of the above places?

Exactly. You might get some good (and more friendly ;-) feedback on k-j
on how to possibly improve your patch. It probably isn't a very good
idea to already send your very first patch to LKML. ;-)

The KJ FAQ document [1] also has some useful tipps.

[1] http://kerneljanitors.org/faq

HTH & Cheers, Tobias

--===============32242239336813716==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============32242239336813716==--
