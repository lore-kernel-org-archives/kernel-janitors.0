From: Viacheslav Dubeyko <slava@dubeyko.com>
Date: Wed, 17 Oct 2018 23:36:16 +0000
Subject: Re: [PATCH] hfs: fix array out of bounds read of array extent
Message-Id: <1539819376.3188.6.camel@slavad-ubuntu-14.04>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180831140538.31566-1-colin.king@canonical.com>
         <20181017150117.fef4f8d8e814aa2d25adba5e@linux-foundation.org>
In-Reply-To: <20181017150117.fef4f8d8e814aa2d25adba5e@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Colin King <colin.king@canonical.com>, linux-fsdevel@vger.kernel.org, dhowells@redhat.com, viro@zeniv.linux.org.uk, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, "Ernesto A.Fernndez" <ernesto.mnd.fernandez@gmail.com>

On Wed, 2018-10-17 at 15:01 -0700, Andrew Morton wrote:
> On Fri, 31 Aug 2018 15:05:38 +0100 Colin King <colin.king@canonical.com> wrote:
> 
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > Currently extent and index i are both being incremented causing
> > an array out of bounds read on extent[i]. Fix this by removing
> > the extraneous increment of extent.
> > 
> > Detected by CoverityScan, CID#711541 ("Out of bounds read")
> > 
> > Fixes: d1081202f1d0 ("HFS rewrite")
> 
> No such commit here.  I assume this is 7cb74be6fd827e314f8.
> 
> > --- a/fs/hfs/extent.c
> > +++ b/fs/hfs/extent.c
> > @@ -300,7 +300,7 @@ int hfs_free_fork(struct super_block *sb, struct hfs_cat_file *file, int type)
> >  		return 0;
> >  
> >  	blocks = 0;
> > -	for (i = 0; i < 3; extent++, i++)


By the way, the hfs_free_extents() has the same logic [1] of for (i = 0;
i < 3; extent++, i++). It looks like that the bug is not fixed yet. Did
anyone test this patch? What's the real reproduction path for the bug?

Thanks,
Vyacheslav Dubeyko.

[1] https://elixir.bootlin.com/linux/latest/source/fs/hfs/extent.c#L251

> > +	for (i = 0; i < 3; i++)
> >  		blocks += be16_to_cpu(extent[i].count);
> >  
> >  	res = hfs_free_extents(sb, extent, blocks, blocks);
> 
> Well, that's quite the bug.  Question is, why didn't anyone notice it. 
> What are the runtime effects?  A disk space leak, perhaps?
> 
> I worry a bit that, given the fs was evidently working "ok", perhaps
> this error was corrected elsewhere in the code and that "fixing" this
> site will have unexpected and undesirable runtime effects.  Can someone
> help me out here?
