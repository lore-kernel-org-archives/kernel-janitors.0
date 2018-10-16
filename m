From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 16 Oct 2018 08:04:24 +0000
Subject: Re: [PATCH] pinctrl: sunxi: Fix a memory leak in 'sunxi_pinctrl_build_state()'
Message-Id: <CACRpkdYFjz_9mvvikCCdpJh=6S8F-u+kuJ3n55brA8e7wPhHtg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181016062228.19472-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20181016062228.19472-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Tue, Oct 16, 2018 at 8:22 AM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:

> If 'krealloc()' fails, 'pctl->functions' is set to NULL.
> We should instead use a temp variable in order to be able to free the
> previously allocated memeory, in case of OOM.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Patch applied with Maxime's ACK.

Yours,
Linus Walleij
