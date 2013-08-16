From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 16 Aug 2013 15:15:21 +0000
Subject: Re: [PATCH 1/5 v2] drivers/gpio/gpio-omap.c: convert comma to semicolon
Message-Id: <CACRpkdanzU9gjKQ7apUVQcBbROBcTgjA9mOfS6C8+4oAD1t_yQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1376378216-18473-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1376378216-18473-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Santosh Shilimkar <santosh.shilimkar@ti.com>, kernel-janitors@vger.kernel.org, Kevin Hilman <khilman@deeprootsystems.com>, Linux-OMAP <linux-omap@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Aug 13, 2013 at 9:16 AM, Julia Lawall <Julia.Lawall@lip6.fr> wrote:

> From: Julia Lawall <Julia.Lawall@lip6.fr>
>
> Replace a comma between expression statements by a semicolon.  This changes
> the semantics of the code, but given the current indentation appears to be
> what is intended.

Aha there is the right patch, sorry for the noise.

Patch applied with Kevin's ACK.

Yours,
Linus Walleij
