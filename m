From: Nicolas Ferre <nicolas.ferre@atmel.com>
Date: Tue, 17 Mar 2015 15:39:19 +0000
Subject: Re: [patch] rtc: at91rm9200: double locking bug in at91_rtc_interrupt()
Message-Id: <55084AA7.3020007@atmel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150315104837.GC20691@mwanda>
In-Reply-To: <20150315104837.GC20691@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Le 15/03/2015 12:01, Boris Brezillon a =E9crit :
> Hi Dan,
>=20
> On Sun, 15 Mar 2015 13:48:37 +0300
> Dan Carpenter <dan.carpenter@oracle.com> wrote:
>=20
>> There is a typo here so we deadlock.
>>
>> Fixes: dd1f1f391dd7 ('rtc: at91rm9200: rework wakeup and interrupt handl=
ing')
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20
> Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>

>=20
> Thanks for fixing this bug.
>=20
> Alessandro, Nicolas, could you agree on who is taking this fix for
> the next -rc cycle ?

I've just collected the tags and asked to Andrew if he can take it.

Thanks for the fix and the "heads up"!

Bye,
--=20
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
