From: David Miller <davem@davemloft.net>
Date: Tue, 17 Aug 2010 03:57:09 +0000
Subject: Re: [PATCH 1/42] drivers/net/wan: Adjust confusing if indentation
Message-Id: <20100816.205709.71100683.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1008052216400.31692@ask.diku.dk>
	<m37hk21tv2.fsf@intrepid.localdomain>
In-Reply-To: <m37hk21tv2.fsf@intrepid.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: khc@pm.waw.pl
Cc: julia@diku.dk, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Krzysztof Halasa <khc@pm.waw.pl>
Date: Sat, 07 Aug 2010 14:37:37 +0200

> Julia Lawall <julia@diku.dk> writes:
>=20
>>  drivers/net/wan/c101.c      |    2 +-
>>  drivers/net/wan/n2.c        |    2 +-
>>  drivers/net/wan/pci200syn.c |    2 +-
>=20
> Fully Acked-by: Krzysztof Ha=A9=A9asa <khc@pm.waw.pl>

Please don't use non-standard commit tags like this "Fully Acked-by:"
thing, otherwise automated tools won't notice and pick them up
properly.

Thanks.
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
