From: Oded Gabbay <oded.gabbay@gmail.com>
Date: Fri, 22 Feb 2019 07:11:17 +0000
Subject: Re: [PATCH -next] habanalabs: use GFP_ATOMIC under spin lock
Message-Id: <CAFCwf10u1qR+GVk-B-uPU9wWgN8yVDmOmWVHRsY0ZdXDM-qiwg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190222054601.4396-1-weiyongjun1@huawei.com> <20190222070450.GA22604@kroah.com>
In-Reply-To: <20190222070450.GA22604@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, Arnd Bergmann <arnd@arndb.de>, Omer Shpigelman <oshpigelman@habana.ai>, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, Feb 22, 2019 at 9:04 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Feb 22, 2019 at 05:46:01AM +0000, Wei Yongjun wrote:
> > A spin lock is taken here so we should use GFP_ATOMIC.
> >
> > Fixes: 0feaf86d4e69 ("habanalabs: add virtual memory and MMU modules")
> > Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> > ---
> >  drivers/misc/habanalabs/memory.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/misc/habanalabs/memory.c b/drivers/misc/habanalabs/memory.c
> > index 9236e52852c6..9e3491dc3b55 100644
> > --- a/drivers/misc/habanalabs/memory.c
> > +++ b/drivers/misc/habanalabs/memory.c
> > @@ -120,7 +120,7 @@ static int alloc_device_memory(struct hl_ctx *ctx, struct hl_mem_in *args,
> >
> >       spin_lock(&vm->idr_lock);
> >       handle = idr_alloc(&vm->phys_pg_pack_handles, phys_pg_pack, 1, 0,
> > -                             GFP_KERNEL);
> > +                             GFP_ATOMIC);
> >       spin_unlock(&vm->idr_lock);
> >
> >       if (handle < 0) {
> >
> >
> >
>
> Ah, nice catch!
>
> Oded, any objection to me taking this patch?
>
> greg k-h
No, of course not.
This patch is:
Reviewed-by: Oded Gabbay <oded.gabbay@gmail.com>
