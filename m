From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 14 Jan 2016 09:12:41 +0000
Subject: Re: [PATCH 2/2] soc: versatile: Drop a useless static qualifier
Message-Id: <CACRpkdbswphyz_CBdFKJae-FsLTKHKqzBDQQAmZbWfdXp5ho4w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1452492975-8402-1-git-send-email-christophe.jaillet@wanadoo.fr>
	<1452492975-8402-2-git-send-email-christophe.jaillet@wanadoo.fr>
In-Reply-To: <1452492975-8402-2-git-send-email-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Mon, Jan 11, 2016 at 7:16 AM, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:

> There is no need to have the 'struct regmap *syscon_regmap' variable
> static in the probe function.
> It only wastes a few bytes of memory.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Sorry a copy-paste error ... used to have it as a global.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I think you should send this to arm@kernel.org for application
as a fixup to the ARM SoC tree. Include my Review tag.

Yours,
Linus Walleij
