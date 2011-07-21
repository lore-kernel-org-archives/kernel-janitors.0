From: David Miller <davem@davemloft.net>
Date: Thu, 21 Jul 2011 21:48:08 +0000
Subject: Re: [patch net-next-2.6 v2] skbuff: fix error handling in
Message-Id: <20110721.144808.175750981188812579.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110720072343.GF6445@shale.localdomain>
	<20110720085149.GI6445@shale.localdomain>
	<1311152386.2338.8.camel@edumazet-HP-Compaq-6005-Pro-SFF-PC>
In-Reply-To: <1311152386.2338.8.camel@edumazet-HP-Compaq-6005-Pro-SFF-PC>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: eric.dumazet@gmail.com
Cc: error27@gmail.com, xma@us.ibm.com, mirq-linux@rere.qmqm.pl, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Wed, 20 Jul 2011 10:59:46 +0200

> Le mercredi 20 juillet 2011 =E0 11:51 +0300, Dan Carpenter a =E9crit :
>> There are two problems:
>> 1) "n" was allocated with alloc_skb() so we should free it with
>>    kfree_skb() instead of regular kfree().
>> 2) We return the freed pointer instead of NULL.
>>=20
>> Signed-off-by: Dan Carpenter <error27@gmail.com>
>=20
> Thanks Dan
>=20
> Reviewed-by: Eric Dumazet <eric.dumazet@gmail.com>

Applied, thanks everyone.
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
