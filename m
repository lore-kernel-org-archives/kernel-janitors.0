From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 14 Dec 2015 14:03:49 +0000
Subject: Re: [PATCH 1/2] zram: Less checks in zram_bvec_write() after error detection
Message-Id: <566ECC45.3050201@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <566B13C1.50907@users.sourceforge.net>
 <566B14DA.1080709@users.sourceforge.net> <20151214002702.GA718@swordfish>
 <566E6895.5050603@users.sourceforge.net> <20151214100323.GA16372@swordfish>
In-Reply-To: <20151214100323.GA16372@swordfish>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Andrew Morton <akpm@linux-foundation.org>

>> I suggest to make the affected exception handling a bit more efficient.
>> Such source code fine-tuning has got a few special consequences.
>=20
> by 'more efficient' you mean saving cpu cycles on 'bvec->bv_len !=3D PAGE=
_SIZE'
> comparison in exception/error path?

Yes =E2=80=A6


> ...
> check_strm:
> 	if (zstrm)
> 		zcomp_strm_release(zram->comp, zstrm);
> 	if (is_partial_io(bvec)) {
> free_uncmem:
> 		kfree(uncmem);
> 	}
> ...

I propose to jump over two sanity checks.


> no.

Thanks for your feedback.

Regards,
Markus
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
