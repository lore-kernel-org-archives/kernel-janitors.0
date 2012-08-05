From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 05 Aug 2012 19:10:27 +0000
Subject: Re: [PATCH 4/6] drivers/gpio/gpio-langwell.c: fix error return code
Message-Id: <CACRpkdb1dpaMiGwqLVVEgnt5ifwqufR7XfnN9qmqqBVyK1UO7Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1344160356-387-1-git-send-email-Julia.Lawall@lip6.fr>
	<1344160356-387-5-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1344160356-387-5-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>, Mika Westerberg <mika.westerberg@linux.intel.com>, Adrian Hunter <adrian.hunter@intel.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, kernel-janitors@vger.kernel.org, Linus Walleij <linus.walleij@stericsson.com>, linux-kernel@vger.kernel.org, Julia Lawall <julia@diku.dk>

On Sun, Aug 5, 2012 at 11:52 AM, Julia Lawall <Julia.Lawall@lip6.fr> wrote:

> From: Julia Lawall <julia@diku.dk>
>
> Convert a 0 error return code to a negative one, as returned elsewhere in the
> function.

Patch applied.

Mika/Adrian: shout if this is incorrect.

Yours,
Linus Walleij
