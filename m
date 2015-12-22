From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 22 Dec 2015 12:48:35 +0000
Subject: Re: [PATCH 4/5] pinctrl: rockchip: add missing of_node_put
Message-Id: <CACRpkdb4m9XHXbmnd9rUyetegBNySjyBn2LpcmN9TfU8stAr+g@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1450715988-4770-1-git-send-email-Julia.Lawall@lip6.fr>
 <1450715988-4770-5-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1450715988-4770-5-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Mon, Dec 21, 2015 at 5:39 PM, Julia Lawall <Julia.Lawall@lip6.fr> wrote:

> for_each_child_of_node performs an of_node_get on each iteration, so a
> return from the loop requires an of_node_put.
>
> A simplified version of the semantic patch that fixes this problem is as
> follows (http://coccinelle.lip6.fr):

Patch applied with Heiko's review tag.

Yours,
Linus Walleij
