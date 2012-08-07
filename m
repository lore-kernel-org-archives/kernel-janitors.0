From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 07 Aug 2012 12:34:48 +0000
Subject: Re: [PATCH 4/6] drivers/pinctrl/pinctrl-nomadik.c: drop devm_kfree of devm_kzalloc'd data
Message-Id: <CACRpkdYLL+butu_kruQY48hrzZ7Jtig9wkN8bC6kxDvLpOyUvQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1344099049-15212-4-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1344099049-15212-4-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Aug 4, 2012 at 6:50 PM, Julia Lawall <Julia.Lawall@lip6.fr> wrote:

> From: Julia Lawall <Julia.Lawall@lip6.fr>
>
> devm_kfree should not have to be explicitly used.
>
> The semantic patch that fixes this problem is as follows:
> (http://coccinelle.lip6.fr/)

Applied.

Thanks,
Linus Walleij
