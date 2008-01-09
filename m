From: Andi Kleen <andi@firstfloor.org>
Date: Wed, 09 Jan 2008 22:46:03 +0000
Subject: Re: [JANITOR PROPOSAL] Switch ioctl functions to ->unlocked_ioctl
Message-Id: <20080109224603.GH15612@one.firstfloor.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20080108164015.GC31504@one.firstfloor.org> <4d8e3fd30801081158j3e7292d0i939776342015b12d@mail.gmail.com> <1199909560.6245.67.camel@cinder.waste.org> <20080109224026.GA4039@agk.fab.redhat.com>
In-Reply-To: <20080109224026.GA4039@agk.fab.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alasdair G Kergon <agk@redhat.com>, Matt Mackall <mpm@selenic.com>, Paolo Ciarrocchi <paolo.ciarrocchi@gmail.com>, Andi Kleen <andi@firstfloor.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, gorcunov@gmail.com

On Wed, Jan 09, 2008 at 10:40:26PM +0000, Alasdair G Kergon wrote:
> On Wed, Jan 09, 2008 at 02:12:40PM -0600, Matt Mackall wrote:
> > You'll need to change the prototype, the unlocked version doesn't take
> > an inode. And you'll need to make sure that nothing in the function uses
> > the inode, which I think Andi forgot to mention.
>  
> This old chestnut again.  Perhaps we could have inode passed to unlocked_ioctl?
> I never understood why it wasn't there in the first place if the plan was for
> .unlocked_ioctl to supercede .ioctl whenever possible.

If you still need inode use

struct inode *inode = file->f_dentry->d_inode;

-Andi

