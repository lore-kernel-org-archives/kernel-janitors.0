From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 02 Oct 2013 13:54:21 +0000
Subject: Re: [patch] drm/radeon: forever loop on error in radeon_do_test_moves()
Message-Id: <CADnq5_OrKSkPrU0if06k6eV5ZWcCKMDbza_ZyHbBhdsUcNhcsg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130701163934.GB4229@elgon.mountain>
In-Reply-To: <20130701163934.GB4229@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Jerome Glisse <jglisse@redhat.com>, Alex Deucher <alexander.deucher@amd.com>, Lauri Kasanen <cand@gmx.com>, =?ISO-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>

On Mon, Jul 1, 2013 at 12:39 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> The error path does this:
>
>         for (--i; i >= 0; --i) {
>
> which is a forever loop because "i" is unsigned.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Sorry I missed this one.  Applied.

Thanks!

Alex

>
> diff --git a/drivers/gpu/drm/radeon/radeon_test.c b/drivers/gpu/drm/radeon/radeon_test.c
> index f4d6bce..12e8099 100644
> --- a/drivers/gpu/drm/radeon/radeon_test.c
> +++ b/drivers/gpu/drm/radeon/radeon_test.c
> @@ -36,8 +36,8 @@ static void radeon_do_test_moves(struct radeon_device *rdev, int flag)
>         struct radeon_bo *vram_obj = NULL;
>         struct radeon_bo **gtt_obj = NULL;
>         uint64_t gtt_addr, vram_addr;
> -       unsigned i, n, size;
> -       int r, ring;
> +       unsigned n, size;
> +       int i, r, ring;
>
>         switch (flag) {
>         case RADEON_TEST_COPY_DMA:
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
