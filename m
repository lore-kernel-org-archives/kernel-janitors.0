From: David Miller <davem@davemloft.net>
Date: Mon, 31 May 2010 07:32:05 +0000
Subject: Re: [patch v2] caif: cleanup: remove duplicate checks
Message-Id: <20100531.003205.179958733.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4BF8E6FE.9000303@bfs.de>
	<20100524162815.GA22515@bicker>
	<AANLkTilHv7m-oJSlXHJRLT9BLKscGLSFnGVCOB9U0kic@mail.gmail.com>
In-Reply-To: <AANLkTilHv7m-oJSlXHJRLT9BLKscGLSFnGVCOB9U0kic@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: sjurbren@gmail.com
Cc: error27@gmail.com, wharms@bfs.de, netdev@vger.kernel.org, sjur.brandeland@stericsson.com, sfr@canb.auug.org.au, kernel-janitors@vger.kernel.org

From: Sjur Br=E6ndeland <sjurbren@gmail.com>
Date: Mon, 24 May 2010 22:47:41 +0200

>  Dan Carpenter <error27@gmail.com> wrote:
>> "phyinfo" can never be null here because we assigned it an address, so I
>> removed both the assert and the second check inside the if statement. =
=A0I
>> removed the "phyinfo->phy_layer !=3D NULL" check as well because that was
>> asserted earlier.
>>
>> Walter Harms suggested I move the "phyinfo->phy_ref_count++;" outside
>> the if condition for readability, so I have done that.
>>
>> Signed-off-by: Dan Carpenter <error27@gmail.com>
> Acked-by: Sjur Braendeland <sjur.brandeland@stericsson.com>
> Thanks, this looks good.

Applied.
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
