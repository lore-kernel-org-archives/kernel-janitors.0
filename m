From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 20 Dec 2013 09:31:57 +0000
Subject: Re: [patch] pinctrl: off by one in msm_config_group_set()
Message-Id: <CACRpkdbXP4gsK1+c+WUYyUzjETm2kq_+CH2QDUVWLmfSAdbD=g@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131216104222.GA19404@elgon.mountain>
In-Reply-To: <20131216104222.GA19404@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Bjorn Andersson <bjorn.andersson@sonymobile.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Mon, Dec 16, 2013 at 11:42 AM, Dan Carpenter
<dan.carpenter@oracle.com> wrote:

> This should be ">=3D ARRAY_SIZE()" instead of "> ARRAY_SIZE()".
>
> Fixes: f365be092572 ('pinctrl: Add Qualcomm TLMM driver')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

This appears to be fixed already by one of Bj=F6rn's follow-up
patches, so dropping this patch.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
