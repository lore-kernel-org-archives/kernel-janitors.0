From: Yehuda Sadeh Weinraub <yehudasa@gmail.com>
Date: Tue, 29 Mar 2011 09:31:43 +0000
Subject: Re: [patch 1/2] ceph: null deref on allocation failure
Message-Id: <AANLkTi=XhutjMEhfYQZ3qpo=r-PzS5fbcF7U9Z0+1wMW@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110329032529.GE9856@bicker>
In-Reply-To: <20110329032529.GE9856@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <error27@gmail.com>
Cc: Sage Weil <sage@newdream.net>, ceph-devel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Mar 28, 2011 at 8:25 PM, Dan Carpenter <error27@gmail.com> wrote:
>
> The original code checked "event_work" for allocation failures, but only
> after it had already use it.
>
> Signed-off-by: Dan Carpenter <error27@gmail.com>
>
> diff --git a/net/ceph/osd_client.c b/net/ceph/osd_client.c
> index 02212ed..b6776cb 100644
> --- a/net/ceph/osd_client.c
> +++ b/net/ceph/osd_client.c
> @@ -1602,11 +1602,11 @@ void handle_watch_notify(struct ceph_osd_client *=
osdc, struct ceph_msg *msg)
> =A0 =A0 =A0 =A0 =A0 =A0 cookie, ver, event);
> =A0 =A0 =A0 =A0if (event) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0event_work =3D kmalloc(sizeof(*event_work)=
, GFP_NOIO);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 INIT_WORK(&event_work->work, do_event_work);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (!event_work) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dout("ERROR: could not all=
ocate event_work\n");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto done_err;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 INIT_WORK(&event_work->work, do_event_work);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0event_work->event =3D event;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0event_work->ver =3D ver;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0event_work->notify_id =3D notify_id;
> --
> To unsubscribe from this list: send the line "unsubscribe ceph-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html

Thanks.

This is already fixed in the latest master branch and will be sent to
Linus soon.

Yehuda
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
