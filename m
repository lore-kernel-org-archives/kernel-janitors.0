From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 16 Aug 2013 15:17:21 +0000
Subject: Re: [PATCH 3/29] drivers/gpio: simplify use of devm_ioremap_resource
Message-Id: <CACRpkdYuV9UG8XBu6Ti5Ef+M-SrwKi02jAEuH=zbqG9q+3oRcQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1376471493-22215-1-git-send-email-Julia.Lawall@lip6.fr>
	<1376471493-22215-4-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1376471493-22215-4-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Aug 14, 2013 at 11:11 AM, Julia Lawall <Julia.Lawall@lip6.fr> wrote:

> From: Julia Lawall <Julia.Lawall@lip6.fr>
>
> Remove unneeded error handling on the result of a call to
> platform_get_resource when the value is passed to devm_ioremap_resource.
>
> Move the call to platform_get_resource adjacent to the call to
> devm_ioremap_resource to make the connection between them more clear.

Patch applied with Viresh's ACK.

Yours,
Linus Walleij
