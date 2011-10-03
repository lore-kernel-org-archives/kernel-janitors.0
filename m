From: David Miller <davem@davemloft.net>
Date: Mon, 03 Oct 2011 17:46:11 +0000
Subject: Re: [patch v2] caif: add error handling for allocation
Message-Id: <20111003.134611.1100932218414818334.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAJK669Yb6V=xr9ZvQGOKGEvmzO1JGhrHD+sR69b04EQxUjOOrQ@mail.gmail.com>
	<20110921072159.GJ4999@elgon.mountain>
	<81C3A93C17462B4BBD7E272753C105791D2BC1882D@EXDCVYMBSTM005.EQ1STM.local>
In-Reply-To: <81C3A93C17462B4BBD7E272753C105791D2BC1882D@EXDCVYMBSTM005.EQ1STM.local>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: sjur.brandeland@stericsson.com
Cc: dan.carpenter@oracle.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Sjur BRENDELAND <sjur.brandeland@stericsson.com>
Date: Fri, 23 Sep 2011 12:38:45 +0200

> [Dan]:=20
>> The allocation of "phyinfo" wasn't checked, and also the allocation
>> wasn't freed on error paths.  Sjur Br=E6ndeland pointed out as well
>> that "phy_driver" should be freed on the error path too.
>>=20
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20
> Looks good, thank you Dan.
> Acked-by: Sjur Br=E6ndeland <sjur.brandeland@stericsson.com>

Applied, thanks.
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
