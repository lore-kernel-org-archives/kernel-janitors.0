From: Andrew Morton <akpm@osdl.org>
Date: Fri, 01 Oct 2004 20:20:43 +0000
Subject: Re: [Kernel-janitors] Could we lose the tag?
Message-Id: <20041001132043.305f1155.akpm@osdl.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============79553561223364877=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041001133038.GC16153@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20041001133038.GC16153@parcelfarce.linux.theplanet.co.uk>
To: kernel-janitors@vger.kernel.org

--===============79553561223364877==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Matthew Wilcox <matthew@wil.cx> wrote:
>
> On Fri, Oct 01, 2004 at 02:59:33PM -0400, Ryan Anderson wrote:
> > On Fri, 2004-10-01 at 09:30, Matthew Wilcox wrote:
> > > In my inbox, I see messages like:
> > > 
> > > 24304 N   Sep 27 Nishanth Aravam ( 104) [Kernel-janitors] [PATCH 2.6.9-rc2 1/5]
> > > 
> > > All the useful information is missing, lost off the edge of the screen.
> > > Removing the [Kernel-janitors] tag would give us 17 precious characters
> > > back -- nearly a quarter of the width of the screen!
> > 
> > > It wouldn't hurt if Nishanth stopped putting the kernel version in the
> > > subject line too, but that's a secondary matter.
> > 
> > I think that's something Andrew Morton has asked for in the "how to send
> > a perfect patch" document he's written.
> 
> Then Andrew's wrong in this matter.  Because I don't see what is being
> patched, I don't review it.  This makes it at least a little bit less
> perfect because I don't review it.
> 

Putting the kernel version in the subject seems fairly pointless, because
all patches should be against the latest kernel version anyway.  But if
people insist I'm OK with putting the kernel version in the Subject: as
long as it is within the first [].  Because I strip out everything which is
within the first [].  I'd propose that as a convention.  So the above would
become

	[patch kernel-janitors 2.6.9-rc2 1/5] frob the knuckle

except I _do_ propagate the "janitor" info into the bk patch title, so in
this case I'd prefer

	[patch 2.6.9-rc2 1/5] janitor: frob the knuckle

which ends up in bk as

	janitor: frob the knuckle

what I am referring to in the above-referenced document is the practice of
mentioning the kernel version in the body of the changelog.  It's
information which becomes instantly obsolete so someone always has to edit
it away.  Given that people should always raise patches against the latest
kernel version and that I'm on the Cc: or To: lines, this version info is
redundant anyway.

--===============79553561223364877==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============79553561223364877==--
