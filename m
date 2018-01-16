From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 16 Jan 2018 09:59:32 +0000
Subject: Re: [PATCH 1/4] gpio-stmpe: Use seq_putc() in stmpe_dbg_show()
Message-Id: <CACRpkdZ0hN+AEbghiyk49s9Qec5Nt2JTZLJfe=oJm1w238U7jA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <df11c007-360e-ce6b-2f70-61b6fb6b49cf@users.sourceforge.net> <91234c1e-9106-ae5d-ebed-8e3d5f272c1e@users.sourceforge.net>
In-Reply-To: <91234c1e-9106-ae5d-ebed-8e3d5f272c1e@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, Jan 12, 2018 at 9:01 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 12 Jan 2018 19:30:50 +0100
>
> A single character (line break) should be put into a sequence.
> Thus use the corresponding function "seq_putc".
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Patch applied.

Yours,
Linus Walleij
