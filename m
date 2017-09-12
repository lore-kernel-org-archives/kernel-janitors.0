From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 12 Sep 2017 14:02:04 +0000
Subject: Re: [PATCH] drm: qxl: ratelimit pr_info message, reduce log spamming
Message-Id: <CACvgo53vbGbvejkEnQuuB-ZuVfbzvSmAsx3Ovj-wMWMQE8ihXw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170912094548.30603-1-colin.king@canonical.com>
In-Reply-To: <20170912094548.30603-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: kernel-janitors@vger.kernel.org, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, ML dri-devel <dri-devel@lists.freedesktop.org>, "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>, Gerd Hoffmann <kraxel@redhat.com>, Dave Airlie <airlied@redhat.com>

Hi Colin,

On 12 September 2017 at 10:45, Colin King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> Simply mmap'ing /dev/dri/card0 repeatedly will spam the kernel
> log with qxl_mmap information messages. The following example code
> illustrates this:
>
> int main(void)
> {
>         int fd = open("/dev/dri/card0", O_RDONLY);
>         if (fd = -1)
>                 err(1, "open failed");
>
>         for (;;) {
>                 void *m = mmap(NULL, 4096, PROT_READ,
>                         MAP_SHARED, fd, 0);
>                 if (m != MAP_FAILED)
>                         munmap(m, 4096);
>         }
> }
>
> Reduce the spamming by ratelimiting the pr_info messages.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/qxl/qxl_ttm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
> index 7ecf8a4b9fe6..6502e699f462 100644
> --- a/drivers/gpu/drm/qxl/qxl_ttm.c
> +++ b/drivers/gpu/drm/qxl/qxl_ttm.c
> @@ -124,7 +124,7 @@ int qxl_mmap(struct file *filp, struct vm_area_struct *vma)
>         int r;
>
>         if (unlikely(vma->vm_pgoff < DRM_FILE_PAGE_OFFSET)) {
> -               pr_info("%s: vma->vm_pgoff (%ld) < DRM_FILE_PAGE_OFFSET\n",
> +               pr_info_ratelimited("%s: vma->vm_pgoff (%ld) < DRM_FILE_PAGE_OFFSET\n",
Quick grep suggests that only qxl and vmwgfx produce any output in
this case, likely for the reasons you mentioned.

That said, I'm not sure how useful the information is - perhaps it's
better to drop it all together? Regardless of the route taken, vmwgfx
could use a similar fix.

HTH
Emil
