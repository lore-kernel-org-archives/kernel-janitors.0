From: Jeff Chase <jnchase@google.com>
Date: Tue, 14 Jul 2020 17:39:10 +0000
Subject: Re: [PATCH] MAINTAINERS: rectify CHRONTEL CH7322 CEC DRIVER section
Message-Id: <CALTkaQ0ur4xVks++7kFowPvLA3b1TAUzt07+uu2T9dPuSuKx4A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200714063035.8635-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20200714063035.8635-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Rob Herring <robh@kernel.org>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, devicetree@vger.kernel.org, linux-media@vger.kernel.org, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Pia Eichinger <pia.eichinger@st.oth-regensburg.de>, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

(Resending as plain text)

Ack. Thanks.

Jeff


On Mon, Jul 13, 2020 at 11:30 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> Commit 7f52faabd2e5 ("media: dt-bindings: Add ch7322 media i2c device")
> slipped in a typo in the CHRONTEL CH7322 CEC DRIVER section.
>
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:
>
>     warning: no file matches    F: \
>         Documentation/devicetree/bindings/media/i2c/chontel,ch7322.yaml
>
> Fix the typo to address this warning.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> applies on next-20200713
>
> Jeff, please ack this patch.
> Hans, please pick this minor non-urgent patch for your -next tree.
>
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ea296f213e45..43661d432b4b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4114,7 +4114,7 @@ M:        Jeff Chase <jnchase@google.com>
>  L:     linux-media@vger.kernel.org
>  S:     Maintained
>  T:     git git://linuxtv.org/media_tree.git
> -F:     Documentation/devicetree/bindings/media/i2c/chontel,ch7322.yaml
> +F:     Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml
>  F:     drivers/media/cec/i2c/ch7322.c
>
>  CIRRUS LOGIC AUDIO CODEC DRIVERS
> --
> 2.17.1
>
