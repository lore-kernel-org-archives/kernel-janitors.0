From: Christoph Hellwig <hch@infradead.org>
Date: Thu, 10 Jan 2008 08:34:25 +0000
Subject: Re: [JANITOR PROPOSAL] Switch ioctl functions to ->unlocked_ioctl
Message-Id: <20080110083425.GA10745@infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20080108164015.GC31504@one.firstfloor.org> <4d8e3fd30801081158j3e7292d0i939776342015b12d@mail.gmail.com> <1199909560.6245.67.camel@cinder.waste.org> <20080109224026.GA4039@agk.fab.redhat.com> <20080109224603.GH15612@one.firstfloor.org> <20080109224513.GF3510@agk.fab.redhat.com>
In-Reply-To: <20080109224513.GF3510@agk.fab.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alasdair G Kergon <agk@redhat.com>, Andi Kleen <andi@firstfloor.org>, Matt Mackall <mpm@selenic.com>, Paolo Ciarrocchi <paolo.ciarrocchi@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, gorcunov@gmail.com, viro@ftp.linux.org.uk

On Wed, Jan 09, 2008 at 10:45:13PM +0000, Alasdair G Kergon wrote:
> On Wed, Jan 09, 2008 at 11:46:03PM +0100, Andi Kleen wrote:
> > struct inode *inode = file->f_dentry->d_inode;
>  
> And oops if that's not defined?

For file_operations which we talk about here it always is defined.
Block_device is a different story, but it'll get a completely different
prototype soon with neither file nor inode passed to it.
