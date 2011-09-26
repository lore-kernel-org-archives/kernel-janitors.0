From: Lauro Ramos Venancio <lauro.venancio@openbossa.org>
Date: Mon, 26 Sep 2011 21:08:40 +0000
Subject: Re: [patch] NFC: use after free on error
Message-Id: <CAK3JMAbFVcGbRZEPZh1LF+ZuFx8FnbktG91_4kY=Na90OfmT2Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110923061435.GA4387@elgon.mountain>
In-Reply-To: <20110923061435.GA4387@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Aloisio Almeida Jr <aloisio.almeida@openbossa.org>, Samuel Ortiz <sameo@linux.intel.com>, "John W. Linville" <linville@tuxdriver.com>, Ilan Elias <ilane@ti.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

2011/9/23 Dan Carpenter <dan.carpenter@oracle.com>:
> We returned a freed variable on some error paths when the intent was
> to return a NULL. =C2=A0Part of the reason this was missed was that the
> code was confusing because it had too many gotos so I removed them
> and simplified the flow a bit.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Acked-by: Lauro Ramos Venancio <lauro.venancio@openbossa.org>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
