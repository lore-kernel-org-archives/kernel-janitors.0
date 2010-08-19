From: David Miller <davem@davemloft.net>
Date: Thu, 19 Aug 2010 07:15:13 +0000
Subject: Re: [PATCH net-next-2.6] atm: remove a net_device_stats clear
Message-Id: <20100819.001513.212394625.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100818083304.2ef2eea4@nehalam>
	<20100818.131043.226780154.davem@davemloft.net>
	<1282164274.2328.2.camel@edumazet-laptop>
In-Reply-To: <1282164274.2328.2.camel@edumazet-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-arm-kernel@lists.infradead.org

From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Wed, 18 Aug 2010 22:44:34 +0200

> Le mercredi 18 ao=FBt 2010 =E0 13:10 -0700, David Miller a =E9crit :
>> Yep, both the ether1 and ether3 patch have this problem.  Looks
>> like we'll see v4 coming some :-)
>=20
> To be fair, we accepted some bits like that in the past ;)

Yes, but let's nip it in the butt immediately when we do
notice it :-)

> [PATCH net-next-2.6] atm: remove a net_device_stats clear
>=20
> No need to clear device stats in lec_open()
>=20
> Signed-off-by: Eric Dumazet <eric.dumazet@gmail.com>

Applied, thanks!
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
