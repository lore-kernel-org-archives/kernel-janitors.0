From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 16 May 2018 14:52:57 +0000
Subject: Re: [PATCH v2] drm/dumb-buffers: Integer overflow in drm_mode_create_ioctl()
Message-Id: <20180516145257.kct63hzesuey6jbc@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180516140026.GA19340@mwanda>
 <152648076734.11239.17221064386545833125@mail.alporthouse.com>
In-Reply-To: <152648076734.11239.17221064386545833125@mail.alporthouse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

On Wed, May 16, 2018 at 03:26:07PM +0100, Chris Wilson wrote:
> Quoting Dan Carpenter (2018-05-16 15:00:26)
> > There is a comment here which says that DIV_ROUND_UP() and that's where
> > the problem comes from.  Say you pick:
> > 
> >         args->bpp = UINT_MAX - 7;
> >         args->width = 4;
> >         args->height = 1;
> > 
> > The integer overflow in DIV_ROUND_UP() means "cpp" is UINT_MAX / 8 and
> > because of how we picked args->width that means cpp < UINT_MAX / 4.
> > 
> > I've fixed it by preventing the integer overflow in DIV_ROUND_UP().  I
> > removed the check for !cpp because it's not possible after this change.
> > I also changed all the 0xffffffffU references to U32_MAX.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> I agree with Daniel that the !cpp check after DIV_ROUND_UP was
> sufficient to guard the current code, but switching to a more idiomatic
> style of overflow checking has its benefits too. Plus I like having
> U32_MAX to compare the type ranges against.
> 

I'm not totally sure what it means to say that the integer overflow is
sufficient.  The overflow check is definitely buggy but if you mean that
it isn't exploitable then you're probably right.  Anyway, let's say you
use use the values I provided in my changelog.  Then I believe we can
reach vgem_gem_dumb_create():

static int vgem_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
   205                                  struct drm_mode_create_dumb *args)
   206  {
   207          struct drm_gem_object *gem_object;
   208          u64 pitch, size;
   209  
   210          pitch = args->width * DIV_ROUND_UP(args->bpp, 8);
                                      ^^^^^^^^^^^^^^^^^^^^^^^^^^
This is now:	pitch = 4           * (U32_MAX / 8);

I would get a static checker warning here because of the integer
overflow in DIV_ROUND_UP().  I'll push that check soon.

   211          size = args->height * pitch;

This is now:	size = 1 * U32_MAX / 2;

   212          if (size = 0)
   213                  return -EINVAL;
   214  
   215          gem_object = vgem_gem_create(dev, file, &args->handle, size);

Then this fails because we can't allocate U32_MAX / 2 bytes.  There
are some other potential numbers we could try instead of the ones I
gave.  On 32bit arches  __vgem_gem_create() has integer overflows if
size is over U32_MAX - PAGE_SIZE so it gets a bit complicated...

   216          if (IS_ERR(gem_object))
   217                  return PTR_ERR(gem_object);
   218  
   219          args->size = gem_object->size;
   220          args->pitch = pitch;
   221  
   222          DRM_DEBUG_DRIVER("Created object of size %lld\n", size);
   223  
   224          return 0;
   225  }

regards,
dan carpenter
