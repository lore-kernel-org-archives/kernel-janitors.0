From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 17 Jul 2015 19:51:08 +0000
Subject: Re: [PATCH] soc: versatile: Add missing kfree in error path
Message-Id: <CACRpkdZvUo08uy6VvLsRMxzfQsw2xE0Zv7MP4GEpUuqVx0gutA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1437155675-29123-1-git-send-email-christophe.jaillet@wanadoo.fr>
In-Reply-To: <1437155675-29123-1-git-send-email-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Arnd Bergmann <arnd@arndb.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, Jul 17, 2015 at 7:54 PM, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:

> If 'of_property_read_string' fails, then 'soc_dev_attr' should be freed,
> otherwise, there is a memory leak.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
