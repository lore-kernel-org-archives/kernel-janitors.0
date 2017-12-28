From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Dec 2017 12:41:43 +0000
Subject: Re: [PATCH] pinctrl: msm: Delete an error message for a failed memory allocation in msm_pinctrl_prob
Message-Id: <CACRpkdZ29c7GVMzOc_cVjwegbifWkqWhh7HQzCtzf-iGy564TA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0d5eae19-c8f9-3280-e68e-419646535512@users.sourceforge.net>
In-Reply-To: <0d5eae19-c8f9-3280-e68e-419646535512@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Dec 27, 2017 at 10:10 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 27 Dec 2017 22:04:22 +0100
>
> Omit an extra message for a memory allocation failure in this function.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Patch applied with Bj=C3=B6rn's ACK.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
