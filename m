From: Lukas Czerner <lczerner@redhat.com>
Date: Thu, 09 Dec 2010 16:05:40 +0000
Subject: Re: [PATCH] ext3: Remove redundant unlikely()
Message-Id: <alpine.LFD.2.00.1012091704290.2731@dhcp-lab-213.englab.brq.redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1291905574-32355-1-git-send-email-tklauser@distanz.ch> <alpine.LFD.2.00.1012091652200.2731@dhcp-lab-213.englab.brq.redhat.com> <20101209160117.GG10190@distanz.ch>
In-Reply-To: <20101209160117.GG10190@distanz.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tobias Klauser <tklauser@distanz.ch>
Cc: Lukas Czerner <lczerner@redhat.com>, Jan Kara <jack@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 9 Dec 2010, Tobias Klauser wrote:

> On 2010-12-09 at 16:53:38 +0100, Lukas Czerner <lczerner@redhat.com> wrote:
> > On Thu, 9 Dec 2010, Tobias Klauser wrote:
> > 
> > > IS_ERR() already implies unlikely(), so it can be omitted here.
> > > 
> > > Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
> > > ---
> > >  fs/ext3/namei.c |    2 +-
> > >  1 files changed, 1 insertions(+), 1 deletions(-)
> > > 
> > > diff --git a/fs/ext3/namei.c b/fs/ext3/namei.c
> > > index bce9dce..268f776 100644
> > > --- a/fs/ext3/namei.c
> > > +++ b/fs/ext3/namei.c
> > > @@ -1047,7 +1047,7 @@ static struct dentry *ext3_lookup(struct inode * dir, struct dentry *dentry, str
> > >  			return ERR_PTR(-EIO);
> > >  		}
> > >  		inode = ext3_iget(dir->i_sb, ino);
> > > -		if (unlikely(IS_ERR(inode))) {
> > > +		if (IS_ERR(inode)) {
> > >  			if (PTR_ERR(inode) = -ESTALE) {
> > >  				ext3_error(dir->i_sb, __func__,
> > >  						"deleted inode referenced: %lu",
> > > 
> > 
> > Good catch, but I guess the same thing may be done for ext2/4.
> 
> I did so actually [0], [1]. Unfortunately I didn't submit the three patches as a
> series.
> 
> [0] http://lists.openwall.net/linux-ext4/2010/12/09/6
> [1] http://lists.openwall.net/linux-ext4/2010/12/09/5
> 
> Cheers
> Tobias
> 

Ok, my apologize. I saw only this one on the ext4 list.

-Lukas
