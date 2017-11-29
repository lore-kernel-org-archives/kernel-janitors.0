From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Nov 2017 12:51:35 +0000
Subject: Re: [PATCH 1/3] pinctrl: mcp23s08: Improve unlocking of a mutex in mcp23s08_irq()
Message-Id: <CACRpkdYBawKHhD833zzhJktv8Ub07=JUW9oCFpvptWzJCL+D-g@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ca1c3c19-7e8c-90f0-493c-b6fae04e6a03@users.sourceforge.net> <01bfaa76-f947-f148-077b-35949bf8e229@users.sourceforge.net>
In-Reply-To: <01bfaa76-f947-f148-077b-35949bf8e229@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-gpio@vger.kernel.org, Sebastian Reichel <sebastian.reichel@collabora.co.uk>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Mon, Oct 30, 2017 at 4:46 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 30 Oct 2017 16:03:12 +0100
>
> * Add a jump target so that a call of the function "mutex_unlock" is stored
>   only twice in this function implementation.
>
> * Replace five calls by goto statements.
>
> * Adjust five condition checks.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Nice, patch applied.

Yours,
Linus Walleij
