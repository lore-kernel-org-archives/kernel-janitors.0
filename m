From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 04 Sep 2019 14:57:01 +0000
Subject: Re: [PATCH] fs/qnx: Delete unnecessary checks before brelse()
Message-Id: <20190904145700.GB3115@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <056c8b8e-abaa-8856-4953-118d14048ddc@web.de>
 <21774224.cEpxz9ejUk@alarsen.net>
In-Reply-To: <21774224.cEpxz9ejUk@alarsen.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anders Larsen <al@alarsen.net>
Cc: Markus Elfring <Markus.Elfring@web.de>, kernel-janitors@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, Deepa Dinamani <deepa.kernel@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jeff Layton <jlayton@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>

On Tue, Sep 03, 2019 at 07:27:22PM +0200, Anders Larsen wrote:
> On Tuesday, 2019-09-03 19:20 Markus Elfring wrote:
> > diff --git a/fs/qnx6/inode.c b/fs/qnx6/inode.c
> > index 345db56c98fd..083170541add 100644
> > --- a/fs/qnx6/inode.c
> > +++ b/fs/qnx6/inode.c
> > @@ -472,10 +472,8 @@ static int qnx6_fill_super(struct super_block *s, void *data, int silent)
> >  out1:
> >  	iput(sbi->inodes);
> >  out:
> > -	if (bh1)
> > -		brelse(bh1);
> > -	if (bh2)
> > -		brelse(bh2);
> > +	brelse(bh1);
> > +	brelse(bh2);
> >  outnobh:
> >  	kfree(qs);
> >  	s->s_fs_info = NULL;

It looks like the original code is buggy:

fs/qnx6/inode.c
   409                  pr_info("superblock #1 active\n");
   410          } else {
   411                  /* superblock #2 active */
   412                  sbi->sb_buf = bh2;
   413                  sbi->sb = (struct qnx6_super_block *)bh2->b_data;
   414                  brelse(bh1);
                        ^^^^^^^^^^
brelse()

   415                  pr_info("superblock #2 active\n");
   416          }
   417  mmi_success:
   418          /* sanity check - limit maximum indirect pointer levels */
   419          if (sb1->Inode.levels > QNX6_PTR_MAX_LEVELS) {
   420                  pr_err("too many inode levels (max %i, sb %i)\n",
   421                         QNX6_PTR_MAX_LEVELS, sb1->Inode.levels);
   422                  goto out;
                        ^^^^^^^^
goto

   423          }

[ snip ]

   466  
   467  out3:
   468          dput(s->s_root);
   469          s->s_root = NULL;
   470  out2:
   471          iput(sbi->longfile);
   472  out1:
   473          iput(sbi->inodes);
   474  out:
   475          if (bh1)
   476                  brelse(bh1);
                        ^^^^^^^^^^^
Double brelse().

   477          if (bh2)
   478                  brelse(bh2);
   479  outnobh:
   480          kfree(qs);
   481          s->s_fs_info = NULL;
   482          return ret;
   483  }

regards,
dan carpenter
