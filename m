From: Cyrill Gorcunov <gorcunov@openvz.org>
Date: Wed, 26 Sep 2012 21:43:33 +0000
Subject: Re: [next:akpm 26/413] kernel/sys.c:1868:14: sparse: incorrect type in argument 1 (different base ty
Message-Id: <20120926214333.GP5749@moon>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120926155910.GA14447@localhost>
In-Reply-To: <20120926155910.GA14447@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Sep 26, 2012 at 02:17:49PM -0700, Andrew Morton wrote:
> On Thu, 27 Sep 2012 00:06:38 +0300
> Dan Carpenter <dan.carpenter@oracle.com> wrote:
> 
> > On Thu, Sep 27, 2012 at 12:19:34AM +0400, Cyrill Gorcunov wrote:
> > > On Wed, Sep 26, 2012 at 01:05:58PM -0700, Andrew Morton wrote:
> > > > > -	if (!access_ok(VERIFY_READ, addr, sizeof(addr)) || addr < mmap_min_addr)
> > > > > +	if (!access_ok(VERIFY_READ, (void *)addr, sizeof(addr)) || addr < mmap_min_addr)
> > > > >  		return -EINVAL;
> > > > >  
> > > > >  	error = -EINVAL;
> > > > 
> > > > It should have the __user tag as well, methinks?
> > > > 
> > > > --- a/kernel/sys.c~prctl-use-access_ok-instead-of-task_size-in-prctl_set_mm-fix-fix
> > > > +++ a/kernel/sys.c
> > > > @@ -1865,7 +1865,8 @@ static int prctl_set_mm(int opt, unsigne
> > > >  	if (opt = PR_SET_MM_EXE_FILE)
> > > >  		return prctl_set_mm_exe_file(mm, (unsigned int)addr);
> > > >  
> > > > -	if (!access_ok(VERIFY_READ, (void *)addr, sizeof(addr)) || addr < mmap_min_addr)
> > > > +	if (!access_ok(VERIFY_READ, (void __user *)addr, sizeof(addr)) ||
> > 
> > I would have expected sizeof(*addr) except addr is unsigned long.
> > To me sizeof(unsigned long) would be clearer.
> Well, we're setting a boundary here so what *is* the correct size? 
> zero?  maximum possible vm space?
> 
> I think I'll drop the patch, pending some clear thinking ;)

Well, lets stick with old well knew TASK_SIZE then, the data copying from
user-space will be checked by copy-from-user helper where needed anyway.

All this tests are rather a fast check for sane values.

[ to me sizeof(unsigned long) doesn't look anyhow cleaner, addr declared
  as long integer by a purpose so I dont get why explicit typing should
  help here ]
