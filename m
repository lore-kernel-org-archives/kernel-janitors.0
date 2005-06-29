From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 29 Jun 2005 00:25:05 +0000
Subject: [KJ] Re: A new soldier
Message-Id: <200506290225.05793.arnd@arndb.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cbecb304050628072325516b6e@mail.gmail.com>
In-Reply-To: <cbecb304050628072325516b6e@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rodrigo Nascimento <underscore0x5f@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org

On Dinsdag 28 Juni 2005 16:23, Rodrigo Nascimento wrote:
> I'm a Science of Computers student and I'd like help you in something.
> I don't know if exists something that I could do. So if someone wants
> a help, I'm a volunteer.

The best place to start would probably be the kernel janitors project.

If you are looking for something bigger with a steep learning curve,
you could try to do a sample architecture implementation like
arch/skeleton and include/asm-skeleton, along the lines of the
original include/asm-generic directory (asm-generic now serves
as a place to put code that is the same on most archs but is different
on others).

Most new architectures that are added keep copying hacks and obsolete
code from one of the existing trees, so it would be really nice to
have a clean starting point for those who don't have as much time to
find the correct solution as a CS student ;-).

You would surely learn a lot about the architecture specific parts
of the kernel and do something useful without the danger of breaking
code that other people depend on, but it's a lot of work.
Maybe that can also be done by more that one person.

	Arnd <><
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
