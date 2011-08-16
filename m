From: Mathias Krause <minipli@googlemail.com>
Date: Tue, 16 Aug 2011 11:03:20 +0000
Subject: Re: [PATCH] tty: clearify structure initializer in notify_write()
Message-Id: <CA+rthh_AW5Yz2ZiOqOTWquXKnsDEd=YcNQ9HiOWu-deSar0eWQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1312027319-1402-1-git-send-email-minipli@googlemail.com>
In-Reply-To: <1312027319-1402-1-git-send-email-minipli@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Greg Kroah-Hartman <gregkh@suse.de>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Mathias Krause <minipli@googlemail.com>

Ping, Greg?

On Sat, Jul 30, 2011 at 2:01 PM, Mathias Krause <minipli@googlemail.com> wr=
ote:
> Even though this is valid C we should not mix C99 initializers with
> obfuscated ANSI C. Stick to C99 and initialize c by its name.
>
> Found by clang:
> drivers/tty/vt/vt.c:262:55: warning: explicitly assigning a variable of
> type 'unsigned int' to itself [-Wself-assign]
> =A0 =A0struct vt_notifier_param param =3D { .vc =3D vc, unicode =3D unico=
de };
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 ~~~~~~~ ^ ~~~~~~~
>
> Signed-off-by: Mathias Krause <minipli@googlemail.com>
> ---
> =A0drivers/tty/vt/vt.c | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
> index b3915b7..e716839 100644
> --- a/drivers/tty/vt/vt.c
> +++ b/drivers/tty/vt/vt.c
> @@ -259,7 +259,7 @@ EXPORT_SYMBOL_GPL(unregister_vt_notifier);
>
> =A0static void notify_write(struct vc_data *vc, unsigned int unicode)
> =A0{
> - =A0 =A0 =A0 struct vt_notifier_param param =3D { .vc =3D vc, unicode =
=3D unicode };
> + =A0 =A0 =A0 struct vt_notifier_param param =3D { .vc =3D vc, .c =3D uni=
code };
> =A0 =A0 =A0 =A0atomic_notifier_call_chain(&vt_notifier_list, VT_WRITE, &p=
aram);
> =A0}
>
> --
> 1.5.6.5
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
