From: David Miller <davem@davemloft.net>
Date: Tue, 27 Apr 2010 21:49:22 +0000
Subject: Re: [patch] ipheth: potential null dereferences on error path
Message-Id: <20100427.144922.176653899.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100427092012.GA29093@bicker>
	<20100427214347.GA2376@bart.evergreen.loc>
In-Reply-To: <20100427214347.GA2376@bart.evergreen.loc>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: agimenez@sysvalve.es
Cc: error27@gmail.com, diego@giagio.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: L. Alberto Gim=E9nez <agimenez@sysvalve.es>
Date: Tue, 27 Apr 2010 23:43:47 +0200

> On Tue, Apr 27, 2010 at 11:20:12AM +0200, Dan Carpenter wrote:
>> The calls to usb_free_buffer() dereference rx_urb and tx_urb in the
>> parameter list but those could be NULL.
>>=20
>> Signed-off-by: Dan Carpenter <error27@gmail.com>
>=20
> Acked-by: L. Alberto Gim=E9nez <agimenez@sysvalve.es>

Applied, thanks everyone.
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
