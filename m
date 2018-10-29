From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Mon, 29 Oct 2018 07:49:43 +0000
Subject: Re: [PATCH 1/8] clk: max77686: constify clk_ops structure
Message-Id: <CAJKOXPceTN=idoipU_X+jZQQorRVh3cBaepw72q5O-vn49OGzw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1540619262-22681-1-git-send-email-Julia.Lawall@lip6.fr> <1540619262-22681-2-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1540619262-22681-2-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia.Lawall@lip6.fr
Cc: Chanwoo Choi <cw00.choi@samsung.com>, kernel-janitors@vger.kernel.org, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, mturquette@baylibre.com, sboyd@kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org

On Sat, 27 Oct 2018 at 08:23, Julia Lawall <Julia.Lawall@lip6.fr> wrote:
>
> The clk_ops structure is only stored in the ops field of a
> clk_init_data structure.  This field is const, so the clk_ops
> structure can be const as well.
>
> Identified and transformed using Coccinelle.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>
> ---
>  drivers/clk/clk-max77686.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
