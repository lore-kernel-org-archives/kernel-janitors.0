From: "Randy.Dunlap" <rdunlap@xenotime.net>
Date: Fri, 07 Jul 2006 15:48:39 +0000
Subject: Re: [KJ] [Kj] [PATCH] drivers/acpi/cm_sbs.c: if statement moved
Message-Id: <20060707084839.cf70326b.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8ef77f2e0607070606y4367b47fw5cc3b195b5fe21a@mail.gmail.com>
In-Reply-To: <8ef77f2e0607070606y4367b47fw5cc3b195b5fe21a@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 7 Jul 2006 15:26:57 +0200 Jesper Juhl wrote:

> On 07/07/06, tom hisch <t.hisch@gmail.com> wrote:
> > hello.
> >
> > this is my first "little" patch it only moves an if statement in
> > drivers/acpi/cm_sbs.c
> > Any recommendations on this are welcome.
> >
> Some general tips:
> 
> 1) Don't just describe what your patch does. Always also describe
> *why* it does it.
> 2) Please include a diffstat with the patch.
> 3) Please add a Signed-off-by: line with the patch.
> 4) It's often a nice thing if the patch reflects what exact version
> the patch applies to - one easy way of doing this is by namind
> directories something like 2.6.18-rc1-orig etc, so the patch looks
> something like this :
> --- linux-2.6.18-rc1-orig/drivers/acpi/cm_sbs.c        2006-07-06
> 23:54: 04.000000000 +0200
> +++ linux-2.6.18-rc1/drivers/acpi/cm_sbs.c     2006-07-07
> 14:54:49.000000000 +0200
> This makes it easy for people to see what kernel the patch applies to.
> An alternative is ofcourse just a simple line saying "this patch
> applies to kernel 2.6.x.y.z.whatever".
> 5) Try to always work against the latest Linus kernel - that is, the
> latest git snapshot.
> 6) As a general rule, don't mix unrelated changes in the same patch -
> send multiple patches instead (like in this patch you are mixing
> whitespace changes and code changes).
> 7) Please read these documents :
>     http://sosdg.org/~coywolf/lxr/source/Documentation/SubmittingPatches
>     http://www.zipworld.com.au/~akpm/linux/patches/stuff/tpp.txt
>     http://sosdg.org/~coywolf/lxr/source/Documentation/HOWTO
> 
> 
> >
> > --- linux-2.6/drivers/acpi/cm_sbs.c.orig        2006-07-06
> > 23:54: 04.000000000 +0200
> > +++ linux-2.6/drivers/acpi/cm_sbs.c     2006-07-07 14:54:49.000000000 +0200
> 
> Doesn't seem to apply cleanly to 2.6.18-rc1 for me :
> 
> Hunk #1 FAILED at 1.
> Hunk #2 FAILED at 69.
> 2 out of 2 hunks FAILED -- saving rejects to file drivers/acpi/cm_sbs.c.rej

Odd, there is only 1 hunk.

> perhaps your mailer mangled it? It's usually a good idea to first mail
> the patch to yourself, save the mail, apply the patch to see if it
> applies or got mangled (ofcourse once you've verified this a few times
> you can stop doing it unless people complain).

Yes, the beginning "--- linux-2.6" line was split into 2 lines
and all tabs were converted to <lots of> spaces.
Latter could have been caused my mail client or server or
could also have been done by using copy-and-paste.

It applies cleanly after fixing that damage, but don't
expect maintainers to do that.

---
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
