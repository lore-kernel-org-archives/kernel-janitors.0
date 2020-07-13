From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 13 Jul 2020 20:00:30 +0000
Subject: Re: [PATCH 2/2] Crypto/chcr: Fix some pr_xxx messages
Message-Id: <bc539dfe-969f-7593-81ef-56b736150e25@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200712211424.276263-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200712211424.276263-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Christophe Jaillet <christophe.jaillet@wanadoo.fr>, linux-crypto@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Ayush Sawal <ayush.sawal@chelsio.com>, "David S. Miller" <davem@davemloft.net>, Herbert Xu <herbert@gondor.apana.org.au>, Rohit Maheshwari <rohitm@chelsio.com>, Vinay Kumar Yadav <vinay.yadav@chelsio.com>

=E2=80=A6
> +++ b/drivers/crypto/chelsio/chcr_algo.c
> @@ -1224,7 +1224,7 @@ static int chcr_handle_cipher_resp(struct skcipher_=
request *req,
>  	wrparam.bytes =3D bytes;
>  	skb =3D create_cipher_wr(&wrparam);
>  	if (IS_ERR(skb)) {
> -		pr_err("chcr : %s : Failed to form WR. No memory\n", __func__);
> +		pr_err("%s : Failed to form WR. No memory\n", __func__);
>  		err =3D PTR_ERR(skb);
>  		goto unmap;
>  	}

I suggest to omit also a space character before the colon in such format st=
rings.

+		pr_err("%s: Failed to form WR. No memory\n", __func__);


Would you like to apply any further fine-tuning around affected error messa=
ges?

Regards,
Markus
