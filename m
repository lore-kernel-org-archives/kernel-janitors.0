From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 07 Sep 2016 20:40:17 +0000
Subject: Re: [PATCH 1/3] pinctrl: ns2: constify pinctrl_ops and pinmux_ops structures
Message-Id: <CACRpkda4cY9KbhOmS-vC6YiDHHvU+27_MwkZEbfbHRnNFjigKA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1472755341-9995-1-git-send-email-Julia.Lawall@lip6.fr>
 <1472755341-9995-2-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1472755341-9995-2-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Thu, Sep 1, 2016 at 8:42 PM, Julia Lawall <Julia.Lawall@lip6.fr> wrote:

> Check for pinctrl_ops and pinmux_ops structures that are only stored in the
> pctlops field and the pmxops field, respectively, of a pinctrl_desc
> structure.  These fields are declared const, so pinctrl_ops and pinmux_ops
> structures that have this property can be declared as const also.

Patch applied.

Yours,
Linus Walleij
