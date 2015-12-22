From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 22 Dec 2015 12:44:24 +0000
Subject: Re: [PATCH 1/5] pinctrl-tegra: add missing of_node_put
Message-Id: <CACRpkda33Jb7m1TWSy3MRjDEWPU9SU0L+ARN3O2Bjs8yato15g@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1450715988-4770-1-git-send-email-Julia.Lawall@lip6.fr>
	<1450715988-4770-2-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1450715988-4770-2-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Dec 21, 2015 at 5:39 PM, Julia Lawall <Julia.Lawall@lip6.fr> wrote:

> for_each_child_of_node performs an of_node_get on each iteration, so a
> return from the loop requires an of_node_put.
>
> A simplified version of the semantic patch that fixes this problem is as
> follows (http://coccinelle.lip6.fr):

Patch applied.

Yours,
Linus Walleij
