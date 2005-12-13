From: Jesper Juhl <jesper.juhl@gmail.com>
Date: Tue, 13 Dec 2005 20:41:50 +0000
Subject: Re: [KJ] de-initialization of = 0 globals
Message-Id: <9a8748490512131241k7ae22fc7xdaf22152f82f5224@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <63769.192.96.150.57.1134482519.squirrel@mail.interexcel.co.za>
In-Reply-To: <63769.192.96.150.57.1134482519.squirrel@mail.interexcel.co.za>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 12/13/05, Bernd Petrovitsch <bernd@firmix.at> wrote:
> On Tue, 2005-12-13 at 17:16 +0200, Jaco Kroon wrote:
> > Bernd Petrovitsch wrote:
> > > On Tue, 2005-12-13 at 16:01 +0200, Jaco Kroon wrote:
> > > [...]
> > >
> > >>Also, if I'm going to be sending patches for these it's obviously a patch
> > >>per affected file, so if I'm going to be sending let's say a hundred of
> > >>these patches it's still a mail per patch or do I just archive them
> > >>somehow and attach them or do I place them on a webserver and mail a uri
> > >>to them?
> > >
> > >
> > > Make one patch per subsystem (unless told otherwise from core LKML
> > > personnel directly) since
> > > -) these are trivial patches and
> > > -) you actually want to mail them to the relevant
> > >    maintainer/mailing-list and Cc: LKML/k-j only.
> > >
> > >     Bernd
> >
> > Ah bugger. That makes it quite a bit more complex :(.  It's relatively
>
> Yes. But otherwise it is IMHO more "complex" (or cumbersome) for the
> readers (and their will be more than only 1) getting e.g. 100 mails with
> trivial fixes for 100 files or flooding some linux-<subsystem>@ ML with
> 12 Emails fixin such trivial stuff in 12 different files.
>
> > easy to single out all the cases (and fix them), but automating the
> > grouping of files into subsystems and assigning maintainers to those
> > subsystems isn't as trivial.
>
> I thought about proposing a new field to maintainers where the relevant
> subdirectories/files listed so that one knows whom to bug if I changed a
> list of given files.
> But this is quite a work, ongoing since this changes and I don't know
> how people react.
>
> The simpler start is probably to generate one large patch for the Kernel
> and separate patches for larger subsystems (IDE, SCSI, etc.) out of it
> since you can just work with an editor.
> And near the end you can send the last ones in one patch and see what
> happens (in the best of all worlds, the patch is accept for -mm which
> usually creates directly enough pressure so that subsystem maintainers
> take it from there).
>
> Or you just send the one large patch and see what happens.
>

Another way into the kernel for patches like this is via the Trivial
Patch Monkey (aka Adrian Bunk) - trivial@rustcorp.com.au

http://www.kernel.org/pub/linux/kernel/people/rusty/trivial/
http://lkml.org/lkml/2005/11/7/159


--
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
