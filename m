From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 11 May 2017 11:34:33 +0000
Subject: Re: [PATCH 1/9] pinctrl: Use seq_putc() in three functions
Message-Id: <CACRpkdaj0oGg=fMxHwdxgU3vNy50Xy8_XQC=kfpedwbKWyozXA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d8cce619-5a37-2f8b-1c07-a4c45443fb50@users.sourceforge.net> <6b51c0df-b48e-c49c-b7ae-ee0c8edfb581@users.sourceforge.net>
In-Reply-To: <6b51c0df-b48e-c49c-b7ae-ee0c8edfb581@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Tue, May 2, 2017 at 11:21 AM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 1 May 2017 22:24:29 +0200
>
> A single character (line break) should be put into a sequence.
> Thus use the corresponding function "seq_putc".
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Looks reasonable. Patch applied.

Yours,
Linus Walleij
