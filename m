From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Fri, 08 Jul 2011 08:01:22 +0000
Subject: Re: [patch] packet: add an unlock on error in fanout_add()
Message-Id: <1310112082.2333.3.camel@edumazet-HP-Compaq-6005-Pro-SFF-PC>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110708072812.GX18655@shale.localdomain>
In-Reply-To: <20110708072812.GX18655@shale.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <error27@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Changli Gao <xiaosuo@gmail.com>, Ben Greear <greearb@candelatech.com>, Neil Horman <nhorman@tuxdriver.com>, "open list:NETWORKING [GENERAL]" <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org

Le vendredi 08 juillet 2011 =C3=A0 10:28 +0300, Dan Carpenter a =C3=A9crit :
> We need to release the "fanout_mutex" here.
>=20
> Signed-off-by: Dan Carpenter <error27@gmail.com>
>=20

Thanks, was fixed yesterday :

http://git.kernel.org/?p=3Dlinux/kernel/git/davem/net-next-2.6.git;a=3Dcomm=
it;h=AFe62c68cd3562c5f8e3ea293e82906dd5a87936



--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
