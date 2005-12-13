From: Jesper Juhl <jesper.juhl@gmail.com>
Date: Tue, 13 Dec 2005 21:59:37 +0000
Subject: Re: [KJ] de-initialization of = 0 globals
Message-Id: <9a8748490512131359u1ba3debblf5c53579f108252d@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <63769.192.96.150.57.1134482519.squirrel@mail.interexcel.co.za>
In-Reply-To: <63769.192.96.150.57.1134482519.squirrel@mail.interexcel.co.za>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 12/13/05, Jesper Juhl <jesper.juhl@gmail.com> wrote:
> On 12/13/05, Jaco Kroon <jaco@kroon.co.za> wrote:
> > >>The simpler start is probably to generate one large patch for the Kernel
> > >>and separate patches for larger subsystems (IDE, SCSI, etc.) out of it
> > >>since you can just work with an editor.
> > >>And near the end you can send the last ones in one patch and see what
> > >>happens (in the best of all worlds, the patch is accept for -mm which
> > >>usually creates directly enough pressure so that subsystem maintainers
> > >>take it from there).
> > >>
> > >>Or you just send the one large patch and see what happens.
> > >
> > > Another way into the kernel for patches like this is via the Trivial
> > > Patch Monkey (aka Adrian Bunk) - trivial@rustcorp.com.au
> > >
> > > http://www.kernel.org/pub/linux/kernel/people/rusty/trivial/
> > > http://lkml.org/lkml/2005/11/7/159
> >
> > I guess that would be the way to go then.  Send one huge patch off to
> > trivial at rustcorp.
> >
> You can try it and if you are lucky Adrian will take it and take care
> of forwarding it for you.
>
> > Should I cc LKLM and KJ?
> >
> Personally I'd probably cc LKML to give other people a chance to
> comment, and also, Andrew Morton is pretty good at picking up atches
> like this from LKML and merging them into -mm.
> Btw; if the patch is large (>50Kb or so) then you should probably not
> include it in the mail, but instead put it online somewhere and
> include an URL to the patch instead or split it into parts and send a
> series of patches.
>
> But in my oppinion, a much better approach (this is what I do myself
> and it usually works out well) would be to make patches for each
> subsystem (or each major dir in the kernel source) and then send the
> patches to LKML with cc to relevant maintainers.   Yes, it takes time
> to do it that way, but your success rate will probably be better and
> eople are likely to respond more ositively to that than just having
> one huge patch dumed on the mailing list.
>
> Before sending a patch series like this I usually do 2 or 3 patches
> for a few different areas, then send those to LKML with maintainers cc
> to get some feedback on wether or not such patches are wanted at all
> before I waste time doing it for the entire tree.
> In this case you could do one patch for everything inside kernel/ and
> another for everything inside something like drivers/usb (just icking
> two random locations with different people maintaining stuff in them).
> Then find out, for each file you change, who is the author of the file
> (looking at comments in the top of each file is usually a good place
> to start) and who is the maintainer (may be the author, may not be) -
> looking in MAINTAINERS and CREDITS is usually good spots to find out.
> Then mail the patches to LKML and cc the people you dug out.
> In the mails you send ask for feedback on wether or not such patches
> are wanted and offer to do the rest of the kernel source if they are.
> Also be sure to include the following info in each mail :
>  - What the patch does
>  - Why the patch does what it does
>  - What testing you've done (compile tested, booted a kernel with the
> patch, etc)
>  - A Signed-off-by line
>  - diffstat -p1 output for the patch
>
> To see an example of this in action look at my recent submission of
> some pointer dereference cleanups.
> Here's my initial "test the waters" mail/patch :
> http://lkml.org/lkml/2005/12/6/362
> And since people responded well to that I then followed up with a
> series of patches that do more similar cleanup (and those patches have
> recently been merged) - here are a few of them :
>  http://lkml.org/lkml/2005/12/11/6
>  http://lkml.org/lkml/2005/12/11/9
>

Forgot to mention a few nice documents I'd recommend you read :

Andrew Morton's "The perfect patch"
   http://www.zip.com.au/~akpm/linux/patches/stuff/tpp.txt
The "SubmittingPatches" document from Documentation/
   http://sosdg.org/~coywolf/lxr/source/Documentation/SubmittingPatches
   (do read the references linked to at the bottom of this document as well)


--
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
