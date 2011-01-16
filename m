From: David Miller <davem@davemloft.net>
Date: Sun, 16 Jan 2011 05:05:17 +0000
Subject: Re: [patch] caif: checking the wrong variable
Message-Id: <20110115.210517.112602810.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110115130639.GA2721@bicker>
	<AANLkTimyZQ1BEJ=tPK4LrYWhQaGd+xhYUsVEENibEVoU@mail.gmail.com>
In-Reply-To: <AANLkTimyZQ1BEJ=tPK4LrYWhQaGd+xhYUsVEENibEVoU@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: sjurbren@gmail.com
Cc: error27@gmail.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Sjur Br=E6ndeland <sjurbren@gmail.com>
Date: Sat, 15 Jan 2011 15:03:31 +0100

>> In the original code we check if (servl =3D NULL) twice. =A0The first ti=
me
>> should print the message that cfmuxl_remove_uplayer() failed and set
>> "ret" correctly, but instead it just returns success. =A0The second check
>> should be checking the value of "ret" instead of "servl".
>>
>> Signed-off-by: Dan Carpenter <error27@gmail.com>
>=20
> Thank you for spotting and correcting this.
> Looks good to me (reviewed only)
>=20
> Acked-by: Sjur Braendeland <sjur.brandeland@stericsson.com>

Applied, thanks.
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
