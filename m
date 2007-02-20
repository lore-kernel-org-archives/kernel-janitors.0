From: "=?UTF-8?Q?H=C3=A5kon_L=C3=B8vdal?=" <hlovdal@gmail.com>
Date: Tue, 20 Feb 2007 15:10:30 +0000
Subject: Re: [KJ] [PATCH][RESEND] is_power_of_2 in rtc
Message-Id: <a01a16b50702200710n2a173e3fxd8a5c41435436c46@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On 19/02/07, Vignesh Babu BM <vignesh.babu@wipro.com> wrote:>              =
   /* check for power of 2 */>> -               if ((arg & (arg-1)) !=3D 0 =
|| arg < 1) {> +               if (!is_power_of_2(arg)) {>                 =
        ret =3D -EINVAL;>                         goto exit;>              =
   }
The comment is no longer necessary since the information it providednow als=
o is present directly in the code (which of course is very good).
BR H=E5kon L=F8vdal
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
