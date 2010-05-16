From: Pekka Enberg <penberg@cs.helsinki.fi>
Date: Sun, 16 May 2010 16:38:55 +0000
Subject: Re: [PATCH 35/37] drivers/block/aoe: Use kmemdup
Message-Id: <AANLkTinise7NM85whW99-aU_DsC2gZRV1o85GO01Egag@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1005152323310.21345@ask.diku.dk>
	 <FA04A0D0-4BAF-4E1D-B8E8-3148E290009F@coraid.com>
In-Reply-To: <FA04A0D0-4BAF-4E1D-B8E8-3148E290009F@coraid.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Ed Cashin <ecashin@coraid.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Julia Lawall <julia@diku.dk>

On Sun, May 16, 2010 at 3:42 PM, Ed Cashin <ecashin@coraid.com> wrote:
> (Because the argument about whether this kind of change
> adds value in general has already taken place. =A0I'd say no, but that's
> based on a maybe faulty idea that if folks weren't doing this they'd have
> more time for reviewing patches, etc.)

It makes kernel text size smaller so yes, it adds value.
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
