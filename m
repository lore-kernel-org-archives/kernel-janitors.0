From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 31 Oct 2017 10:06:56 +0000
Subject: Re: [PATCH] mfd: ab8500-debugfs: Use common error handling code in ab8500_print_modem_registers()
Message-Id: <CACRpkdYcxuYyYhXQ86qs--QKY=ovHhdOOYAV=XxSN_7mDONQ1Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <7af3098c-21fd-aa16-237f-0359d312cac7@users.sourceforge.net>
In-Reply-To: <7af3098c-21fd-aa16-237f-0359d312cac7@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Fri, Oct 27, 2017 at 5:37 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 27 Oct 2017 17:20:45 +0200
>
> Add jump targets so that two error messages are stored only once
> at the end of this function implementation.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
