From: Nish Aravamudan <nish.aravamudan@gmail.com>
Date: Mon, 21 Nov 2005 23:11:32 +0000
Subject: Re: [KJ] [PATCH] sound/oss/maestro3.c printk args concatenation
Message-Id: <29495f1d0511211511m9fc8fe9y8159065e1caca601@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <437E8107.2000103@nhw.pl>
In-Reply-To: <437E8107.2000103@nhw.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On 11/21/05, H=E5kon L=F8vdal <hlovdal@gmail.com> wrote:
> On 11/19/05, Witold Rugowski <rugowski@nhw.pl> wrote:
> > Removed string concatenation in printk args
>
> Why would you turn a compile-time string concatenation into a run-time
> string concatenation? I am not sure what the benefits from doing that sho=
uld be.

Good point. Depends on when gcc evaluates __TIME__ and __DATE__? In
any case, the OSS driver in question has an ALSA version, which means
that it's fully deprecated and probably will be gotten rid of by
Adrian Bunk soon enough. Unless it has functionality that the ALSA
driver doesn't. In any case, I would just forget about this patch.

Thanks,
Nish

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
