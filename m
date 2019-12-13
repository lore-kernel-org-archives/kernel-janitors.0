From: Maxime Jourdan <mjourdan@baylibre.com>
Date: Fri, 13 Dec 2019 07:47:26 +0000
Subject: Re: [PATCH] media: meson: add missing allocation failure check on new_buf
Message-Id: <CAMO6naxT0syj74xvcectWXyVGmHfOU341A+15tC+GW4hsq+yJQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191204141159.1432387-1-colin.king@canonical.com>
 <20191205080611.GY93017@google.com>
In-Reply-To: <20191205080611.GY93017@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Cc: devel@driverdev.osuosl.org, Kevin Hilman <khilman@baylibre.com>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Colin King <colin.king@canonical.com>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Linux Media Mailing List <linux-media@vger.kernel.org>

On Thu, Dec 5, 2019 at 9:06 AM Sergey Senozhatsky
<sergey.senozhatsky.work@gmail.com> wrote:
>
> On (19/12/04 14:11), Colin King wrote:
> [..]
> > diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
> > index 0a1a04fd5d13..8dd1396909d7 100644
> > --- a/drivers/staging/media/meson/vdec/vdec.c
> > +++ b/drivers/staging/media/meson/vdec/vdec.c
> > @@ -133,6 +133,8 @@ vdec_queue_recycle(struct amvdec_session *sess, struct vb2_buffer *vb)
> >       struct amvdec_buffer *new_buf;
> >
> >       new_buf = kmalloc(sizeof(*new_buf), GFP_KERNEL);
> > +     if (!new_buf)
> > +             return;
> >       new_buf->vb = vb;

Thanks for the patch Colin.

>
> So the buffer is not getting recycled? IOW is leaked?
>
>         -ss

The "recycle" mechanism in the meson vdec is a way to tell the
firmware that "hey, both userspace and kernel are done using this
buffer, you can start using it again".

Not queuing it for recycling means that the firmware won't use this
buffer again, it's not desirable of course, but if there is no memory
left to allocate a simple list element then there are bigger problems
at hand.

Either way, failing this allocation and returning instantly doesn't
leak anything or do any damage kernel-side.
