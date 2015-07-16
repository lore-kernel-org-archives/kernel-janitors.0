From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 16 Jul 2015 08:21:02 +0000
Subject: Re: [patch v2 1/2] pinctrl: samsung: don't truncate the last char
Message-Id: <CACRpkdbG8Qm6tyrNqJJBb=cg9jR=CZsdhTksn_7XQXHGf5fNng@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150619085203.GO28762@mwanda>
	<20150622151223.GA14156@mwanda>
In-Reply-To: <20150622151223.GA14156@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Mon, Jun 22, 2015 at 5:12 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:

> We were allocating enough space because sizeof("-grp") and
> sizeof("-mux") are both equal to 5 but in the snprintf() we only allowed
> for 4 characters so the last 'p' and 'x' characters were truncated.
>
> The allocate and sprintf can be done in one step with the kasprintf().
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied with Krzysztof's review tag.

Yours,
Linus Walleij
