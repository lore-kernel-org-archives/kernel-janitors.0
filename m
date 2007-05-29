From: "Arnaldo Carvalho de Melo" <acme@ghostprotocols.net>
Date: Tue, 29 May 2007 16:16:42 +0000
Subject: Re: [KJ] setting fops member pointers to NULL?
Message-Id: <39e6f6c70705290916w6c83383o81007b05f9ffcb08@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0705290526590.24445@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0705290526590.24445@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 5/29/07, Robert P. J. Day <rpjday@mindspring.com> wrote:
> On Tue, 29 May 2007, Arnaldo Carvalho de Melo wrote:
>
> > Original question:
> >
> > ----------------------------------- 8< --------------------------------------
> > is there any rationale for setting a member of the file_operations
> > structure explicitly to NULL as opposed to leaving it initialized?
> > ----------------------------------- 8< --------------------------------------
>                                                         ^^^^^^^^^^^
>
> argh.  of course, in that original post, i meant "uninitialized", but
> i'm guessing most people figured that out.
>
> > It wasn't about _unused_ fields, was about _uninitialized_ fields.
> > These fields can be set to default values (function pointers with a
> > fallback implementation perhaps) at registration (or later) time.
> >
> > If we forget about all the other issues about initialization that were
> > discussed (.bss, struct named fields initialization, garbage going into
> > uninitialized non global variables, etc) and stick to the original question
> > the answer, in my experience, would be:
> >
> > 1. Source code gets more cluttered if the not needed initialization to zero
> >   is used
> > 2. if the field is removed from the struct, only the files that initialized it
> >    will have to be patched
> > 3. the resulting binary is the same
> >
> > - Arnaldo
>
> the only defensible rationale i can see for someone setting one of
> those fields to NULL would be to visually emphasize that fact -- sort
> of as a comment field.  but, in the end, it would of course make no
> difference in the code.

I forgot about that rationale: "to stress that there is no
implementation for this method, use whatever is the default behaviour
for this operation".

But if that is the case better use a comment, more clear :-)

- Arnaldo
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
