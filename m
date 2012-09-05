From: Ezequiel Garcia <elezegarcia@gmail.com>
Date: Wed, 05 Sep 2012 19:36:52 +0000
Subject: Re: [PATCH 3/5] drivers/media/platform/s5p-tv/mixer_video.c: fix error return code
Message-Id: <CALF0-+W6i548ehTDaqkXj7ehFfYBPOBwwPBZQ03eMoo+3K3HXQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1346775269-12191-3-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1346775269-12191-3-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Senna Tschudin <peter.senna@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, kernel-janitors@vger.kernel.org, Julia.Lawall@lip6.fr, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Peter,

On Tue, Sep 4, 2012 at 1:14 PM, Peter Senna Tschudin
<peter.senna@gmail.com> wrote:
> From: Peter Senna Tschudin <peter.senna@gmail.com>
>
> Convert a nonnegative error return code to a negative one, as returned
> elsewhere in the function.
>
> A simplified version of the semantic match that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)
>
> // <smpl>
> (
> if@p1 (\(ret < 0\|ret != 0\))
>  { ... return ret; }
> |
> ret@p1 = 0
> )
> ... when != ret = e1
>     when != &ret
> *if(...)
> {
>   ... when != ret = e2
>       when forall
>  return ret;
> }
>
> // </smpl>
>
> Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>
>
> ---
>  drivers/media/platform/s5p-tv/mixer_video.c |    5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/s5p-tv/mixer_video.c b/drivers/media/platform/s5p-tv/mixer_video.c
> index a9c6be3..f139fed 100644
> --- a/drivers/media/platform/s5p-tv/mixer_video.c
> +++ b/drivers/media/platform/s5p-tv/mixer_video.c
> @@ -83,6 +83,7 @@ int __devinit mxr_acquire_video(struct mxr_device *mdev,
>         mdev->alloc_ctx = vb2_dma_contig_init_ctx(mdev->dev);
>         if (IS_ERR_OR_NULL(mdev->alloc_ctx)) {
>                 mxr_err(mdev, "could not acquire vb2 allocator\n");
> +               ret = -ENODEV;
>                 goto fail_v4l2_dev;
>         }
>
> @@ -764,8 +765,10 @@ static int mxr_video_open(struct file *file)
>         }
>
>         /* leaving if layer is already initialized */
> -       if (!v4l2_fh_is_singular_file(file))
> +       if (!v4l2_fh_is_singular_file(file)) {
> +               ret = -EBUSY; /* Not sure if EBUSY is the best for here */
>                 goto unlock;
> +       }
>
>         /* FIXME: should power be enabled on open? */
>         ret = mxr_power_get(mdev);
>

Well, same to say here. I think if you look at this functions you'll realize
it's so much easy to just initialize ret to something, instead of the obviously
wrong ret = 0.

IMO, initializing ret to zero it's a free ticket to bugs. :-)

Hope it helps,
Ezequiel.
