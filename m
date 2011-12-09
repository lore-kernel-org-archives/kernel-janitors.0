From: Sjur BRENDELAND <sjur.brandeland@stericsson.com>
Date: Fri, 09 Dec 2011 12:43:20 +0000
Subject: RE: [patch -next] xshm: calling unlock improperly in
Message-Id: <81C3A93C17462B4BBD7E272753C105791FB0D6B448@EXDCVYMBSTM005.EQ1STM.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111208192402.GA8810@elgon.mountain>
In-Reply-To: <20111208192402.GA8810@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Hi Dan,

> We got interrupted before we could take the lock here, and so we
> shouldn't call unlock.

Acked-by: Sjur Br=E6ndeland <sjur.brandeland@stericsson.com>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thank you for spotting this.
I will include this patch when I send out a new patch-set.

Regards,
Sjur
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
