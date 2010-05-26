From: =?UTF-8?Q?Sjur_Br=C3=A6ndeland?= <sjurbren@gmail.com>
Date: Wed, 26 May 2010 18:13:32 +0000
Subject: Re: [PATCH 8/17] net/caif: Add missing spin_unlock
Message-Id: <AANLkTilnCabvmeF11Rx7XlEHxwqrnBk2JLznOBLrCHuC@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1005261756150.23743@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1005261756150.23743@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <julia@diku.dk>
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Julia Lawall <julia@diku.dk> wrote:
> From: Julia Lawall <julia@diku.dk>
>
> Add a spin_unlock missing on the error path. =C2=A0The spin lock is used =
in a
> balanced way elsewhere in the file.

This bug is already fixed an part of net-2.6 in
"[PATCH net-2.6 5/6] caif: Bugfix - missing spin_unlock".

Regards
Sjur
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
