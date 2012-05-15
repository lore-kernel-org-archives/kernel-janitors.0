From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 15 May 2012 06:13:51 +0000
Subject: Re: [patch] ext4: potential NULL dereference on error
Message-Id: <20120515061351.GI16984@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120513144104.GA21998@elgon.mountain>
 <20120514222535.GW5353@quack.suse.cz>
In-Reply-To: <20120514222535.GW5353@quack.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Kara <jack@suse.cz>
Cc: Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, May 15, 2012 at 12:25:35AM +0200, Jan Kara wrote:
> On Sun 13-05-12 17:41:04, Dan Carpenter wrote:
> > @@ -508,7 +509,8 @@ fallback_retry:
> >  	for (i = 0; i < ngroups; i++) {
> >  		grp = (parent_group + i) % ngroups;
> >  		desc = ext4_get_group_desc(sb, grp, NULL);
> > -		grp_free = ext4_free_inodes_count(sb, desc);
> > +		if (desc)
> > +			grp_free = ext4_free_inodes_count(sb, desc);
> >  		if (desc && grp_free && grp_free >= avefreei) {
>   So you it would be more logical to do:
> 		if (desc) {
> 			grp_free = ext4_free_inodes_count(sb, desc);
> 			if (grp_free && grpfree >= avefreei) {
> 	 			*group = grp;
> 	 			return 0;
> 			}
> 		}
> 
>   Wouldn't it?

Yeah.  You're obviously right.  I'll resend.

regards,
dan carpenter

