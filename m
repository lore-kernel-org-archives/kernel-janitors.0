From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 08 Feb 2017 08:41:09 +0000
Subject: Re: [patch] pinctrl: samsung: checking for IS_ERR() instead of NULL
Message-Id: <CAJKOXPcHYMGCGiq3X2vkpT9VtXe6hBBROjeZdJSvL2MMooYTPQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170208072310.GA12877@mwanda>
In-Reply-To: <20170208072310.GA12877@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Feb 8, 2017 at 9:23 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> devm_ioremap() returns NULL on error.  It doesn't return error pointers.
>
> Fixes: 8b1bd11c1f8f ("pinctrl: samsung: Add the support the multiple IORESOURCE_MEM for one pin-bank")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Fix already sent by Wei:
https://www.spinics.net/lists/arm-kernel/msg560747.html

Best regards,
Krzysztof
