From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Fri, 08 Sep 2017 13:45:40 +0000
Subject: Re: [PATCH] drm/vc4: clean up error handling on devm_kzalloc failure
Message-Id: <CACvgo50Z18JtkD=F9PtxfQjjJBP9JhCOSUKkHYcLYO+NFnqU-Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170908131704.32517-1-colin.king@canonical.com>
In-Reply-To: <20170908131704.32517-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: kernel-janitors@vger.kernel.org, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, ML dri-devel <dri-devel@lists.freedesktop.org>

Hi Colin,

On 8 September 2017 at 14:17, Colin King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> The current error handling on devm_kzalloc failures performs a non-null
> check on connector. Thss check is redundant because connector is null
> at that failure point.  With this check removed, we may as well make
> the failure path into a trivial -ENOMEM return to clean up the error
> handling.
>
> Detected by CoverityScan CID#1339527 ("Logically dead code")
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 13 ++-----------
>  1 file changed, 2 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 937da8dd65b8..a8808c1a1e03 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -311,14 +311,11 @@ static struct drm_connector *vc4_hdmi_connector_init(struct drm_device *dev,
>  {
>         struct drm_connector *connector = NULL;
I think you can drop the initializer now.

-Emil
