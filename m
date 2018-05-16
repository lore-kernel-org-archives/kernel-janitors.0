From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 16 May 2018 15:15:54 +0000
Subject: Re: [PATCH v2] drm/dumb-buffers: Integer overflow in drm_mode_create_ioctl()
Message-Id: <20180516151554.grlkemklosrksxpm@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180516140026.GA19340@mwanda>
 <152648076734.11239.17221064386545833125@mail.alporthouse.com>
 <20180516145257.kct63hzesuey6jbc@mwanda>
 <152648261507.11239.9847993632251714966@mail.alporthouse.com>
In-Reply-To: <152648261507.11239.9847993632251714966@mail.alporthouse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

On Wed, May 16, 2018 at 03:56:55PM +0100, Chris Wilson wrote:
> Quoting Dan Carpenter (2018-05-16 15:52:57)
> > On Wed, May 16, 2018 at 03:26:07PM +0100, Chris Wilson wrote:
> > > Quoting Dan Carpenter (2018-05-16 15:00:26)
> > > > There is a comment here which says that DIV_ROUND_UP() and that's where
> > > > the problem comes from.  Say you pick:
> > > > 
> > > >         args->bpp = UINT_MAX - 7;
> > > >         args->width = 4;
> > > >         args->height = 1;
> > > > 
> > > > The integer overflow in DIV_ROUND_UP() means "cpp" is UINT_MAX / 8 and
> > > > because of how we picked args->width that means cpp < UINT_MAX / 4.
> > > > 
> > > > I've fixed it by preventing the integer overflow in DIV_ROUND_UP().  I
> > > > removed the check for !cpp because it's not possible after this change.
> > > > I also changed all the 0xffffffffU references to U32_MAX.
> > > > 
> > > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > 
> > > I agree with Daniel that the !cpp check after DIV_ROUND_UP was
> > > sufficient to guard the current code, but switching to a more idiomatic
> > > style of overflow checking has its benefits too. Plus I like having
> > > U32_MAX to compare the type ranges against.
> > > 
> > 
> > I'm not totally sure what it means to say that the integer overflow is
> > sufficient.  The overflow check is definitely buggy but if you mean that
> > it isn't exploitable then you're probably right.  Anyway, let's say you
> > use use the values I provided in my changelog.  Then I believe we can
> > reach vgem_gem_dumb_create():
> 
> But we are talking about
> 
> 	cpp = (U32_MAX + 8) / 8
> 

No, no.  That's not the problem.  The problem is the - 1 subtraction.  I
explained poorly.  The issue is when "bpp" is U32_MAX - 7.  The define
looks like:

#define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))

So "n" is (U32_MAX - 7) and "d" is 8.  "(n) + (d)" wraps to zero.  We do
the "- 1" subtraction so that gives us U32_MAX.  And finally we divide
by "d" to get "U32_MAX / 8".

regards,
dan carpenter
