From: Kalle Valo <kvalo@codeaurora.org>
Date: Fri, 13 Sep 2019 14:23:35 +0000
Subject: Re: [PATCH] ssb: make array pwr_info_offset static const, makes object smaller
Message-Id: <20190913142335.C25DF607F1@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190906154053.32218-1-colin.king@canonical.com>
In-Reply-To: <20190906154053.32218-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>
Cc: Michael Buesch <m@bues.ch>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
>=20
> Don't populate the array pwr_info_offset on the stack but instead make it
> static const. Makes the object code smaller by 207 bytes.
>=20
> Before:
>    text	   data	    bss	    dec	    hex	filename
>   26066	   3000	     64	  29130	   71ca	drivers/ssb/pci.o
>=20
> After:
>    text	   data	    bss	    dec	    hex	filename
>   25763	   3096	     64	  28923	   70fb	drivers/ssb/pci.o
>=20
> (gcc version 9.2.1, amd64)
>=20
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Acked-by: Michael B=C3=BCsch <m@bues.ch>

Patch applied to wireless-drivers-next.git, thanks.

d3bb26868105 ssb: make array pwr_info_offset static const, makes object sma=
ller

--=20
https://patchwork.kernel.org/patch/11135599/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes
