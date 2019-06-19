From: Nick Crews <ncrews@chromium.org>
Date: Wed, 19 Jun 2019 15:44:50 +0000
Subject: Re: [PATCH][next] platform/chrome: wilco_ec: fix null pointer dereference on failed kzalloc
Message-Id: <CAHX4x85id5dwXrBSVHTZaRV43JGAxZwMkvnDN6yH5_Mg4UxRPg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190618153924.19491-1-colin.king@canonical.com> <20190619053012.GM28859@kadam>
In-Reply-To: <20190619053012.GM28859@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Colin King <colin.king@canonical.com>, Benson Leung <bleung@chromium.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, kernel-janitors@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, Dmitry Torokhov <dtor@google.com>

On Tue, Jun 18, 2019 at 11:30 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Tue, Jun 18, 2019 at 04:39:24PM +0100, Colin King wrote:
> > diff --git a/drivers/platform/chrome/wilco_ec/event.c b/drivers/platform/chrome/wilco_ec/event.c
> > index c975b76e6255..e251a989b152 100644
> > --- a/drivers/platform/chrome/wilco_ec/event.c
> > +++ b/drivers/platform/chrome/wilco_ec/event.c
> > @@ -112,8 +112,11 @@ module_param(queue_size, int, 0644);
> >  static struct ec_event_queue *event_queue_new(int capacity)
> >  {
> >       size_t entries_size = sizeof(struct ec_event *) * capacity;
> > -     struct ec_event_queue *q = kzalloc(sizeof(*q) + entries_size,
> > -                                        GFP_KERNEL);
> > +     struct ec_event_queue *q;
> > +
> > +     q = kzalloc(sizeof(*q) + entries_size, GFP_KERNEL);
> > +     if (!q)
> > +             return NULL;
>
> We have a new struct_size() macro designed for these allocations.
>
>         q = kzalloc(struct_size(q, entries, capacity), GFP_KERNEL);
>
> The advantage is that it checks for integer overflows.
>
> regards,
> dan carpenter
>

Thanks Dan, I like that.

Dmitry Torokhov also had some thoughts on this patch at
https://crrev.com/c/1661053, I'll send a patch that adds this and
fixes his concerns in a bit.

Cheers,
Nick
