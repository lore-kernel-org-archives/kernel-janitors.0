From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Tue, 27 Apr 2004 20:30:25 +0000
Subject: Re: [Kernel-janitors] [PATCH] Remove bootsect_helper and A comment
Message-Id: <20040427133025.4fe25e63.rddunlap@osdl.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============82378221970443777=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <4087C7F2.9050308@greatcn.org>
In-Reply-To: <4087C7F2.9050308@greatcn.org>
To: kernel-janitors@vger.kernel.org

--===============82378221970443777==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 26 Apr 2004 11:28:47 +0200 maximilian attems wrote:

| On Fri, 23 Apr 2004, Coywolf Qi Hunt wrote:
| 
| [..]
| > 
| > This is it:
| > ========================================================================
| > --- linux-2.6.5/arch/i386/boot/setup.S.orig	Sat Mar  6 23:49:33 2004
| > +++ linux-2.6.5/arch/i386/boot/setup.S	Sun Mar  7 07:23:10 2004
| 
| you didn't read the faq ;)
| 
| please try:
| 
| cp -a linux-2.6.5 linux-2.6.5-foo
| vi linux-2.6.5-foo/arch/i386/boot/setup.S
| configure + compile + test.
| diff -ruN linux-2.6.5 linux-2.6.5-foo > patch-rm-bootsect_helper
| if it's ok now send it to the ml.

Oh darn, I need to read the FAQ.

I confess, I don't always make a copy of the entire linux/ tree
to patch 1 file (or even a small number of files).
I think using .orig, as Coywolf did here, is fine.

configure + compile + test is still needed, yes.

--
~Randy
http://www.madrone.org/quotes/2003.0226.akpm.txt

--===============82378221970443777==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============82378221970443777==--
