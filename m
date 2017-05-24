From: Kalle Valo <kvalo@codeaurora.org>
Date: Wed, 24 May 2017 13:47:21 +0000
Subject: Re: ssb: Delete an error message for a failed memory allocation in ssb_devices_register()
Message-Id: <20170524134721.3D33D60711@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b8db3326-5f45-04c0-a6c3-d5183d602e8d@users.sourceforge.net>
In-Reply-To: <b8db3326-5f45-04c0-a6c3-d5183d602e8d@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-wireless@vger.kernel.org, =?UTF-8?Q?Michael_B=c3=bcsch?= <m@bues.ch>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>

SF Markus Elfring <elfring@users.sourceforge.net> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 17 May 2017 18:12:16 +0200
>=20
> Omit an extra message for a memory allocation failure in this function.
>=20
> This issue was detected by using the Coccinelle software.
>=20
> Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-R=
efactor_Strings-WSang_0.pdf
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> Acked-by: Michael B=C3=BCsch <m@bues.ch>

Patch applied to wireless-drivers-next.git, thanks.

c6c092dcb21e ssb: Delete an error message for a failed memory allocation in=
 ssb_devices_register()

--=20
https://patchwork.kernel.org/patch/9731583/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
