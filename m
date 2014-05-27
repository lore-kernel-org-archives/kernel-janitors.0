From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 27 May 2014 14:06:43 +0000
Subject: Re: [PATCH 18/18] pinctrl: pinconf-generic: Use kmemdup instead of kmalloc + memcpy
Message-Id: <CACRpkdaz+cz5WW6udV7eQw+=c+mrzicp9rf5ab-P_E-iJ=ezYw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1401117687-28911-1-git-send-email-benoit.taine@lip6.fr>
	<1401117687-28911-19-git-send-email-benoit.taine@lip6.fr>
In-Reply-To: <1401117687-28911-19-git-send-email-benoit.taine@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benoit Taine <benoit.taine@lip6.fr>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Mon, May 26, 2014 at 5:21 PM, Benoit Taine <benoit.taine@lip6.fr> wrote:

> This issue was reported by coccicheck using the semantic patch
> at scripts/coccinelle/api/memdup.cocci
>
> Signed-off-by: Benoit Taine <benoit.taine@lip6.fr>
> ---
> Not compile tested, due incompatible architecture.

Excellent fix, thanks. Patch applied.

Yours,
Linus Walleij
