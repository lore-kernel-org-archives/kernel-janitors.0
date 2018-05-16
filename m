From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 16 May 2018 14:26:07 +0000
Subject: Re: [PATCH v2] drm/dumb-buffers: Integer overflow in drm_mode_create_ioctl()
Message-Id: <152648076734.11239.17221064386545833125@mail.alporthouse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180516140026.GA19340@mwanda>
In-Reply-To: <20180516140026.GA19340@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Gustavo Padovan <gustavo@padovan.org>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

Quoting Dan Carpenter (2018-05-16 15:00:26)
> There is a comment here which says that DIV_ROUND_UP() and that's where
> the problem comes from.  Say you pick:
> 
>         args->bpp = UINT_MAX - 7;
>         args->width = 4;
>         args->height = 1;
> 
> The integer overflow in DIV_ROUND_UP() means "cpp" is UINT_MAX / 8 and
> because of how we picked args->width that means cpp < UINT_MAX / 4.
> 
> I've fixed it by preventing the integer overflow in DIV_ROUND_UP().  I
> removed the check for !cpp because it's not possible after this change.
> I also changed all the 0xffffffffU references to U32_MAX.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

I agree with Daniel that the !cpp check after DIV_ROUND_UP was
sufficient to guard the current code, but switching to a more idiomatic
style of overflow checking has its benefits too. Plus I like having
U32_MAX to compare the type ranges against.

Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
