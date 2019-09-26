From: Benson Leung <bleung@chromium.org>
Date: Thu, 26 Sep 2019 22:43:56 +0000
Subject: Re: [PATCH -next] platform/chrome: wilco_ec: Use kmemdup in enqueue_events()
Message-Id: <CANLzEkvw-UGKh-OE91PiHUvOnjjdbTngnUNwFC4f54h8e3v+9A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190621135907.112232-1-yuehaibing@huawei.com> <CAHX4x86qUKPTkRFWvWMgTMh1VY8ogJfr55khsSJTakS0emiyFA@mail.gmail.com>
In-Reply-To: <CAHX4x86qUKPTkRFWvWMgTMh1VY8ogJfr55khsSJTakS0emiyFA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nick Crews <ncrews@chromium.org>
Cc: YueHaibing <yuehaibing@huawei.com>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, linux-kernel <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Hey Nick,
On Fri, Jun 21, 2019 at 7:51 AM Nick Crews <ncrews@chromium.org> wrote:
>
> Thanks Yue, looks good to me.
>
> Nick
>
> On Fri, Jun 21, 2019 at 7:59 AM YueHaibing <yuehaibing@huawei.com> wrote:
> >
> > Use kmemdup rather than duplicating its implementation
> >
> > Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> > ---
> >  drivers/platform/chrome/wilco_ec/event.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/platform/chrome/wilco_ec/event.c b/drivers/platform/chrome/wilco_ec/event.c
> > index c975b76e6255..70156e75047e 100644
> > --- a/drivers/platform/chrome/wilco_ec/event.c
> > +++ b/drivers/platform/chrome/wilco_ec/event.c
> > @@ -248,10 +248,9 @@ static int enqueue_events(struct acpi_device *adev, const u8 *buf, u32 length)
> >                 offset += event_size;
> >
> >                 /* Copy event into the queue */
> > -               queue_event = kzalloc(event_size, GFP_KERNEL);
> > +               queue_event = kmemdup(event, event_size, GFP_KERNEL);
> >                 if (!queue_event)
> >                         return -ENOMEM;
> > -               memcpy(queue_event, event, event_size);
> >                 event_queue_push(dev_data->events, queue_event);
> >         }
> >
> >
> >

Looks like this was already incorporated into your commit,
platform/chrome: wilco_ec: Use kmemdup in enqueue_events().

Thanks!
Benson

-- 
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org
