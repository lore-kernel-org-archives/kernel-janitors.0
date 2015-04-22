From: David Herrmann <dh.herrmann@gmail.com>
Date: Wed, 22 Apr 2015 17:35:11 +0000
Subject: Re: [patch] kdbus: checking for IS_ERR() instead of NULL
Message-Id: <CANq1E4RA33bqBUi=27mOX4Wh03k5suNQpgQAFjX68rW-EuVXHg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150422133900.GB29383@mwanda>
In-Reply-To: <20150422133900.GB29383@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Mack <daniel@zonque.org>, David Herrmann <dh.herrmann@googlemail.com>, Djalal Harouni <tixxdz@opendz.org>, linux-kernel <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Hi

On Wed, Apr 22, 2015 at 3:39 PM, Dan Carpenter <dan.carpenter@oracle.com> w=
rote:
> "e->user" is never assigned an ERR_PTR().  It can be set to NULL so I
> assume that is what is intended here.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/ipc/kdbus/queue.c b/ipc/kdbus/queue.c
> index a449464..21fce62 100644
> --- a/ipc/kdbus/queue.c
> +++ b/ipc/kdbus/queue.c
> @@ -637,7 +637,7 @@ int kdbus_queue_entry_move(struct kdbus_queue_entry *=
e,
>         lockdep_assert_held(&src->lock);
>         lockdep_assert_held(&dst->lock);
>
> -       if (WARN_ON(IS_ERR(e->user)) || WARN_ON(list_empty(&e->entry)))
> +       if (WARN_ON(!e->user) || WARN_ON(list_empty(&e->entry)))

e->user is allowed to be NULL (eg., for kernel notifications). We used
to set it to ERR_PTR(foobar), but that's long gone. This WARN_ON() can
simply be dropped.

I wrote a patch [1] and will send it to Greg later.

Thanks
David

[1] http://cgit.freedesktop.org/~dvdhrm/linux/commit/?h=3Dkdbus&id=EB132dd8=
5d4e882a9b3ad07497b26d1b55cab893

>                 return -EINVAL;
>         if (src =3D dst)
>                 return 0;
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
