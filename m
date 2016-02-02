From: Joe Perches <joe@perches.com>
Date: Tue, 02 Feb 2016 14:33:05 +0000
Subject: Re: [patch] mwifiex: fix a reversed condition
Message-Id: <1454423585.7291.16.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160202100005.GA3040@mwanda>
In-Reply-To: <20160202100005.GA3040@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>, Amitkumar Karwar <akarwar@marvell.com>, chunfan chen <jeffc@marvell.com>
Cc: Nishant Sarmukadam <nishants@marvell.com>, Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, 2016-02-02 at 13:00 +0300, Dan Carpenter wrote:
> The NULL test here is reversed.
[]
> diff --git a/drivers/net/wireless/marvell/mwifiex/scan.c b/drivers/net/wi=
reless/marvell/mwifiex/scan.c
[]
> @@ -2196,7 +2196,7 @@ int mwifiex_ret_802_11_scan(struct mwifiex_private =
*priv,
> =A0
> =A0			pmatch =3D adapter->nd_info->matches[idx];
> =A0
> -			if (!pmatch) {
> +			if (pmatch) {
> =A0				memset(pmatch, 0, sizeof(*pmatch));

As it's just been kzalloc'ed,
this memset seems unnecessary as well.

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
