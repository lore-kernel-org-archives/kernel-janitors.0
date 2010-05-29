From: David Miller <davem@davemloft.net>
Date: Sat, 29 May 2010 07:19:24 +0000
Subject: Re: [patch] caif: unlock on error path in cfserl_receive()
Message-Id: <20100529.001924.214235371.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100526151648.GA15439@bicker>
	<AANLkTimYIjrnOwzSyALY42fhNojwh1zawaFMUVC1ml6Y@mail.gmail.com>
In-Reply-To: <AANLkTimYIjrnOwzSyALY42fhNojwh1zawaFMUVC1ml6Y@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: sjurbren@gmail.com
Cc: error27@gmail.com, sjur.brandeland@stericsson.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Sjur Br=E6ndeland <sjurbren@gmail.com>
Date: Wed, 26 May 2010 20:18:36 +0200

> Hi Dan.
>=20
> Dan Carpenter <error27@gmail.com> wrote:
>> There was an spin_unlock missing on the error path. =A0The spin_lock was
>> tucked in with the declarations so it was hard to spot. =A0I added a new
>> line.
>>
>> Signed-off-by: Dan Carpenter <error27@gmail.com>
> Acked-by: Sjur Braendeland

Applied.

Sjur, in the future please provide your full email address in
Acked-by: lines just as you would for a Signed-off-by: tag.

I fixed it up this time.

Thanks.
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
