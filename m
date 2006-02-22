From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 22 Feb 2006 19:29:44 +0000
Subject: Re: [KJ] [Patch] kzalloc conversion in fs/proc
Message-Id: <20060222192944.GA30436@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============55784013242573582=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140562907.26848.0.camel@alice>
In-Reply-To: <1140562907.26848.0.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============55784013242573582==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 22.02.2006 [22:14:25 +0300], Alexey Dobriyan wrote:
> On Wed, Feb 22, 2006 at 01:14:39AM +0100, Jesper Juhl wrote:
> > On 2/22/06, Eric Sesterhenn <snakebyte@gmx.de> wrote:
> > > On Wed, 2006-02-22 at 00:13 +0100, Jesper Juhl wrote:
> > > > This looks broken - did you even compile test that patch?
> > > >
> > > > Don't you mean :
> > > >
> > > > return kzalloc(sizeof(struct vmcore), GFP_KERNEL);
> > >
> > > *yuck*, sorry for this, didnt compile test since it doesnt build
> > > with my config. fixed patch below.
> > >
> >
> > Hmm, a simple
> >
> > $ make allyesconfig
> > $ make fs/proc/kcore.o
> 
> How on earth did this succeed? I always, always get

I'm guessing it might have been a tree he's already built a kernel in
before? You usually need to let a normal make go through a few steps
before trying this, so that the asm->asm-$arch symlink is created and a
few other files are generated, IIRC.

Thanks,
Nish

--===============55784013242573582==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============55784013242573582==--
