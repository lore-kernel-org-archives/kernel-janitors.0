From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 31 Aug 2017 13:44:46 +0000
Subject: Re: [PATCH] pinctrl: core: Delete an error message for a failed memory allocation in pinctrl_registe
Message-Id: <CACRpkda9ZPf7wwHySCT88QFqwUO4C25fprkeCNo8uUSNfnO94A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <31e88aa1-83b1-586b-447b-94ffc122567f@users.sourceforge.net>
In-Reply-To: <31e88aa1-83b1-586b-447b-94ffc122567f@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Sat, Aug 26, 2017 at 8:20 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 26 Aug 2017 20:15:21 +0200
>
> Omit an extra message for a memory allocation failure in this function.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Patch applied.

Yours,
Linus Walleij
