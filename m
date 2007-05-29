From: "Arnaldo Carvalho de Melo" <acme@ghostprotocols.net>
Date: Tue, 29 May 2007 15:57:50 +0000
Subject: Re: [KJ] setting fops member pointers to NULL?
Message-Id: <39e6f6c70705290857k233c1e36ie7703f3727aa1acf@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0705290526590.24445@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0705290526590.24445@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 5/29/07, Bernd Petrovitsch <bernd@firmix.at> wrote:
> On Tue, 2007-05-29 at 10:55 -0400, John Anthony Kazos Jr. wrote:
> > > > > >   is there any rationale for setting a member of the file_operations
> > > > > > structure explicitly to NULL as opposed to leaving it initialized?  i
> > > > > > would think that's the default just based on the rules for C
> > > > > > initialization, but i just wanted to make sure since i see it done
> > > > > > every so often and wonder if there's something tricky going on that i
> > > > > > don't know about.
> > > > > >
> > > > > > rday
> > > > > >
> > > > > >
> > > > > Actually, C doesn't really care ... if you declare something, but don't
> > > > > initialize it explicitly,
> > > > > it will be filled with some random value (probably whatever was at the
> > > > > given memory address
> > > > > before C gave it to your var).
> > > >
> > > > Nope. If it is a global variable and it is left uninitialized it
> > > > will be put into the .bss section and thus set to zero at program
> > > > start.
> > > >
> > > > If you use named initializers in struct initializations, no matter
> > > > where, the uninitialized members will be set to zero too.
> > >
> > > that's the understanding i had, so setting those global member fields
> > > to NULL in various fops structures is really redundant.  doesn't hurt
> > > anything, of course.
> >
> > Well, it does increase the on-disk image size. Like when code uses
>
> The original question was about unused fields in (e.g.) struct
> file_operations.
> Are you sure your comment makes any sense then?

Original question:

----------------------------------- 8< --------------------------------------
is there any rationale for setting a member of the file_operations
structure explicitly to NULL as opposed to leaving it initialized?
----------------------------------- 8< --------------------------------------

It wasn't about _unused_ fields, was about _uninitialized_ fields. These
fields can be set to default values (function pointers with a fallback
implementation perhaps) at registration (or later) time.

If we forget about all the other issues about initialization that were
discussed (.bss, struct named fields initialization, garbage going into
uninitialized non global variables, etc) and stick to the original question
the answer, in my experience, would be:

1. Source code gets more cluttered if the not needed initialization to zero
   is used
2. if the field is removed from the struct, only the files that initialized it
    will have to be patched
3. the resulting binary is the same

- Arnaldo
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
