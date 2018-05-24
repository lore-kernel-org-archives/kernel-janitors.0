From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 24 May 2018 08:30:48 +0000
Subject: Re: [PATCH 1/5] pinctrl: at91-pio4: add missing of_node_put
Message-Id: <CACRpkdbr-fRKKwPfuL1gqM_zRWjq=TRT+kgGttzUPUKgQ7B0OQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1527102436-13447-1-git-send-email-Julia.Lawall@lip6.fr>
 <1527102436-13447-2-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1527102436-13447-2-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Wed, May 23, 2018 at 9:07 PM, Julia Lawall <Julia.Lawall@lip6.fr> wrote:

> The device node iterators perform an of_node_get on each iteration, so a
> jump out of the loop requires an of_node_put.
>
> The semantic patch that fixes this problem is as follows
> (http://coccinelle.lip6.fr):
>
> // <smpl>
> @@
> expression root,e;
> local idexpression child;
> iterator name for_each_child_of_node;
> @@
>
>  for_each_child_of_node(root, child) {
>    ... when != of_node_put(child)
>        when != e = child
> +  of_node_put(child);
> ?  break;
>    ...
> }
> ... when != child
> // </smpl>
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Patch applied with Ludovic's ACK!

Yours,
Linus Walleij
