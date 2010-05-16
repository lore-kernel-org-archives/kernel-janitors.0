From: Julia Lawall <julia@diku.dk>
Date: Sun, 16 May 2010 18:26:31 +0000
Subject: Re: ERR_PTR and PTR_ERR
Message-Id: <Pine.LNX.4.64.1005162025560.12921@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1005161055580.6573@ask.diku.dk>
 <Pine.LNX.4.64.1005161104520.6573@ask.diku.dk> <20100516173729.GE31073@ZenIV.linux.org.uk>
In-Reply-To: <20100516173729.GE31073@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, 16 May 2010, Al Viro wrote:

> On Sun, May 16, 2010 at 11:05:23AM +0200, Julia Lawall wrote:
> > On Sun, 16 May 2010, Julia Lawall wrote:
> > 
> > > I see a number of occurrences of code like the following:
> > > 
> > >  	if (IS_ERR(alg))
> > > 		return ERR_PTR(PTR_ERR(alg));
> > > 
> > > Is there any reason why the second line couldn't just be return alg?
> > 
> > Hmm, never mind.  It seems to address a type problem.
> 
> More idiomatic way to deal with that is ERR_CAST(); see e.g. ext2_lookup() for
> use case:

Thanks.  That looks much nicer than ERR_PTR(PTR_ERR(alg)).

julia


> 	...
> 	inode = NULL;
> 	if (ino) {
> 		inode = ext2_iget(dir->i_sb, ino);
> 		if (unlikely(IS_ERR(inode))) {
> 			if (PTR_ERR(inode) = -ESTALE) {
> 				ext2_error(dir->i_sb, __func__,
> 						"deleted inode referenced: %lu",
> 						(unsigned long) ino);
> 				return ERR_PTR(-EIO);
> 			} else {
> 				return ERR_CAST(inode);
> 			}
> 		}
> 	}
> 	return d_splice_alias(inode, dentry);
> 
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
