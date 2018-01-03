From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 03 Jan 2018 08:03:41 +0000
Subject: Re: [PATCH 05/12] pinctrl: armada-37xx: account for const type of of_device_id.data
Message-Id: <CACRpkdZhQKtrRgGu17OkDca3XR1tOSj00hDABfv6JKTUDh2xBg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1514899688-27844-1-git-send-email-Julia.Lawall@lip6.fr>
 <1514899688-27844-6-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1514899688-27844-6-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Tue, Jan 2, 2018 at 2:28 PM, Julia Lawall <Julia.Lawall@lip6.fr> wrote:

> The data field of an of_device_id structure has type const void *, so
> there is no need for a const-discarding cast when putting const values
> into such a structure.
>
> Done using Coccinelle.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Patch applied with Gregory's ACK.

Yours,
Linus Walleij
