From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 22 Feb 2006 20:24:42 +0000
Subject: Re: [KJ] [Patch] kzalloc conversion in fs/proc
Message-Id: <20060222202442.GB30436@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============46482100621894284=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140562907.26848.0.camel@alice>
In-Reply-To: <1140562907.26848.0.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============46482100621894284==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 22.02.2006 [21:51:27 +0200], Jaco Kroon wrote:
> Nishanth Aravamudan wrote:
> > On 22.02.2006 [22:14:25 +0300], Alexey Dobriyan wrote:
> > 
> >>On Wed, Feb 22, 2006 at 01:14:39AM +0100, Jesper Juhl wrote:
> >>
> >>>On 2/22/06, Eric Sesterhenn <snakebyte@gmx.de> wrote:
> >>>
> >>>>On Wed, 2006-02-22 at 00:13 +0100, Jesper Juhl wrote:
> >>>>
> >>>>>This looks broken - did you even compile test that patch?
> >>>>>
> >>>>>Don't you mean :
> >>>>>
> >>>>>return kzalloc(sizeof(struct vmcore), GFP_KERNEL);
> >>>>
> >>>>*yuck*, sorry for this, didnt compile test since it doesnt build
> >>>>with my config. fixed patch below.
> >>>>
> >>>
> >>>Hmm, a simple
> >>>
> >>>$ make allyesconfig
> >>>$ make fs/proc/kcore.o
> >>
> >>How on earth did this succeed? I always, always get
> > 
> > 
> > I'm guessing it might have been a tree he's already built a kernel
> > in before? You usually need to let a normal make go through a few
> > steps before trying this, so that the asm->asm-$arch symlink is
> > created and a few other files are generated, IIRC.
> 
> That imho constitutes a dependancy bug in the build process.  After
> all, it is rather obvious from the error that include/linux/sched.h
> depends on asm/param.h, but obviously param.h doesn't exist yet.
> Presumably this is due to the asm link not being created yet.  But
> surely there is a way to "force" the issue with make?

Could be... I'll wait to hear what Alexey says (an ls -l include in
the kernel source dir is sufficient). I would have that the make
fs/proc/kcore.o would have done whatever it needed, as well, but maybe
not. Like I said, the easiest way is to just let plan "make" do its
thing for a few steps.

Thanks,
Nish

--===============46482100621894284==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============46482100621894284==--
