From: "Jesper Juhl" <jesper.juhl@gmail.com>
Date: Fri, 07 Jul 2006 13:26:57 +0000
Subject: Re: [KJ] [Kj] [PATCH] drivers/acpi/cm_sbs.c: if statement moved
Message-Id: <9a8748490607070626r6df600e8pdfa8e4b5e34d2123@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8ef77f2e0607070606y4367b47fw5cc3b195b5fe21a@mail.gmail.com>
In-Reply-To: <8ef77f2e0607070606y4367b47fw5cc3b195b5fe21a@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 07/07/06, tom hisch <t.hisch@gmail.com> wrote:
> hello.
>
> this is my first "little" patch it only moves an if statement in
> drivers/acpi/cm_sbs.c
> Any recommendations on this are welcome.
>
Some general tips:

1) Don't just describe what your patch does. Always also describe
*why* it does it.
2) Please include a diffstat with the patch.
3) Please add a Signed-off-by: line with the patch.
4) It's often a nice thing if the patch reflects what exact version
the patch applies to - one easy way of doing this is by namind
directories something like 2.6.18-rc1-orig etc, so the patch looks
something like this :
--- linux-2.6.18-rc1-orig/drivers/acpi/cm_sbs.c        2006-07-06
23:54: 04.000000000 +0200
+++ linux-2.6.18-rc1/drivers/acpi/cm_sbs.c     2006-07-07
14:54:49.000000000 +0200
This makes it easy for people to see what kernel the patch applies to.
An alternative is ofcourse just a simple line saying "this patch
applies to kernel 2.6.x.y.z.whatever".
5) Try to always work against the latest Linus kernel - that is, the
latest git snapshot.
6) As a general rule, don't mix unrelated changes in the same patch -
send multiple patches instead (like in this patch you are mixing
whitespace changes and code changes).
7) Please read these documents :
    http://sosdg.org/~coywolf/lxr/source/Documentation/SubmittingPatches
    http://www.zipworld.com.au/~akpm/linux/patches/stuff/tpp.txt
    http://sosdg.org/~coywolf/lxr/source/Documentation/HOWTO


>
> --- linux-2.6/drivers/acpi/cm_sbs.c.orig        2006-07-06
> 23:54: 04.000000000 +0200
> +++ linux-2.6/drivers/acpi/cm_sbs.c     2006-07-07 14:54:49.000000000 +0200

Doesn't seem to apply cleanly to 2.6.18-rc1 for me :

Hunk #1 FAILED at 1.
Hunk #2 FAILED at 69.
2 out of 2 hunks FAILED -- saving rejects to file drivers/acpi/cm_sbs.c.rej

perhaps your mailer mangled it? It's usually a good idea to first mail
the patch to yourself, save the mail, apply the patch to see if it
applies or got mangled (ofcourse once you've verified this a few times
you can stop doing it unless people complain).


-- 
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
