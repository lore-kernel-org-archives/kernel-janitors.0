From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 27 Apr 2018 13:30:37 +0000
Subject: Re: [PATCH 03/61] auxdisplay: simplify getting .drvdata
Message-Id: <CACRpkdbZC8-V4fOmyCSzgvXoxFg35vN1VdNq_VbKTK3QXo2Btg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180419140641.27926-1-wsa+renesas@sang-engineering.com> <20180419140641.27926-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180419140641.27926-4-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, kernel-janitors@vger.kernel.org, Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>

On Thu, Apr 19, 2018 at 4:05 PM, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:

> We should get drvdata from struct device directly. Going via
> platform_device is an unneeded step back and forth.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Sorry for slow reply.

Yours,
Linus Walleij
