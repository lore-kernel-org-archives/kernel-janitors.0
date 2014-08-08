From: David Miller <davem@davemloft.net>
Date: Fri, 08 Aug 2014 17:28:58 +0000
Subject: Re: [PATCH 12/14] ll_temac: delete unneeded test before of_node_put
Message-Id: <20140808.102858.2296909606267579093.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1407492475-26283-12-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1407492475-26283-12-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-arm-kernel@lists.infradead.org

From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri,  8 Aug 2014 12:07:53 +0200

> From: Julia Lawall <Julia.Lawall@lip6.fr>
>=20
> Of_node_put supports NULL as its argument, so the initial test is not
> necessary.
>=20
> Suggested by Uwe Kleine-K=F6nig.
>=20
> The semantic patch that fixes this problem is as follows:
> (http://coccinelle.lip6.fr/)
 ...
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied.
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
