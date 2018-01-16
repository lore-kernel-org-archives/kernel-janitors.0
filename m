From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 16 Jan 2018 10:08:48 +0000
Subject: Re: [PATCH] pinctrl: sprd: Use seq_putc() in sprd_pinconf_group_dbg_show()
Message-Id: <CACRpkdb3WeAFZ8kMB5E6rnwHJtY5=+uFHWOeh1MDp+vejY8qWg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a951aa57-b12d-5c8c-561b-d11d385f9872@users.sourceforge.net>
In-Reply-To: <a951aa57-b12d-5c8c-561b-d11d385f9872@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-gpio@vger.kernel.org, Baolin Wang <baolin.wang@spreadtrum.com>, Colin Ian King <colin.king@canonical.com>, Dan Carpenter <dan.carpenter@oracle.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Sat, Jan 13, 2018 at 12:48 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 13 Jan 2018 12:42:14 +0100
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
