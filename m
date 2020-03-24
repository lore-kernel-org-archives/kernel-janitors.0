From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Mar 2020 09:06:10 +0000
Subject: Re: [PATCH] MAINTAINERS: adjust entry to ICST clocks YAML schema creation
Message-Id: <CACRpkdYUURewhao=uDbKOmn2OnhBN6G6qnjUXgN2OBH_w_u2Qw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200323184501.5756-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20200323184501.5756-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Joe Perches <joe@perches.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>

On Mon, Mar 23, 2020 at 7:45 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:

> Commit 78c7d8f96b6f ("dt-bindings: clock: Create YAML schema for ICST
> clocks") transformed arm-integrator.txt into arm,syscon-icst.yaml, but did
> not adjust the reference to that file in the ARM INTEGRATOR, VERSATILE AND
> REALVIEW SUPPORT entry in MAINTAINERS.
>
> Hence, since then, ./scripts/get_maintainer.pl --self-test complains:
>
>   warning: no file matches \
>   F: Documentation/devicetree/bindings/clock/arm-integrator.txt
>
> Update the file entry in MAINTAINERS to the new transformed yaml file.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Thanks!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
