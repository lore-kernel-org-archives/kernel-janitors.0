From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 13 Jul 2016 11:36:57 +0000
Subject: Re: [patch] Squashfs: silence some uninitialized variable warnings
Message-Id: <20160713113657.GV32247@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160713100249.GB29468@mwanda>
 <CAKvUva_iHkPh-nxJ=GiWseoe4Tv4beCb+Z8v_9VgnuCjLaRV+w@mail.gmail.com>
In-Reply-To: <CAKvUva_iHkPh-nxJ=GiWseoe4Tv4beCb+Z8v_9VgnuCjLaRV+w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Silvan Jegen <s.jegen@gmail.com>
Cc: Phillip Lougher <phillip@squashfs.org.uk>, lkml <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Jul 13, 2016 at 01:29:32PM +0200, Silvan Jegen wrote:
> Hi Dan
> 
> On Wed, Jul 13, 2016 at 12:02 PM, Dan Carpenter
> <dan.carpenter@oracle.com> wrote:
> > We print these values in the TRACE() code before we check that
> > fill_meta_index() was successful.  It makes my static checker complain.
> >
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> >
> > diff --git a/fs/squashfs/file.c b/fs/squashfs/file.c
> > index 13d8094..46679e2 100644
> > --- a/fs/squashfs/file.c
> > +++ b/fs/squashfs/file.c
> > @@ -334,9 +334,9 @@ failed:
> >   */
> >  static int read_blocklist(struct inode *inode, int index, u64 *block)
> >  {
> > -       u64 start;
> > +       u64 start = -1;
> 
> Do you assign the negative value to the unsigned variable here on purpose?
> 

Yeah.  It's just a garbage value but hopefully it would stand out in the
printk.

regards,
dan carpenter

