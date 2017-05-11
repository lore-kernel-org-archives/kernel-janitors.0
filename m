From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 11 May 2017 13:24:17 +0000
Subject: Re: [PATCH 4/9] pinctrl: Replace two seq_printf() calls by seq_puts() in pinconf_show_map()
Message-Id: <CACRpkda3YE5KzNSjdU-YY5PA3H4-BZLy_KpRmdd4ohsTc_AR_w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d8cce619-5a37-2f8b-1c07-a4c45443fb50@users.sourceforge.net> <68dee714-acb7-5c69-7764-3e302a335c38@users.sourceforge.net>
In-Reply-To: <68dee714-acb7-5c69-7764-3e302a335c38@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Tue, May 2, 2017 at 11:24 AM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 2 May 2017 09:52:50 +0200
>
> Strings which did not contain data format specifications should be put
> into a sequence. Thus use the corresponding function "seq_puts".
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Patch applied.

Yours,
Linus Walleij
