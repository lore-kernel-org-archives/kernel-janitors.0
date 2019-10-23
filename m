From: Tzung-Bi Shih <tzungbi@google.com>
Date: Wed, 23 Oct 2019 08:03:07 +0000
Subject: Re: [PATCH] ASoC: mediatek: Check SND_SOC_CROS_EC_CODEC dependency
Message-Id: <CA+Px+wU5UrVC0pk5pbfGTdVsh7OHcBx_MhbC3Bjmj_+zgn54PQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191023063103.44941-1-maowenan@huawei.com>
In-Reply-To: <20191023063103.44941-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mao Wenan <maowenan@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, ALSA development <alsa-devel@alsa-project.org>, kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, yuehaibing@huawei.com, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org, =?UTF-8?B?U2h1bmxpIFdhbmcgKOeOi+mhuuWIqSk=?= <shunli.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, tglx@linutronix.de, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, KaiChieh Chuang <kaichieh.chuang@mediatek.com>

On Wed, Oct 23, 2019 at 2:31 PM Mao Wenan <maowenan@huawei.com> wrote:
>
> If SND_SOC_MT8183_MT6358_TS3A227E_MAX98357A=y,
> below errors can be seen:
> sound/soc/codecs/cros_ec_codec.o: In function `send_ec_host_command':
> cros_ec_codec.c:(.text+0x534): undefined reference to `cros_ec_cmd_xfer_status'
> cros_ec_codec.c:(.text+0x101c): undefined reference to `cros_ec_get_host_event'
>
> This is because it will select SND_SOC_CROS_EC_CODEC
> after commit 2cc3cd5fdc8b ("ASoC: mediatek: mt8183: support WoV"),
> but SND_SOC_CROS_EC_CODEC depends on CROS_EC.
>
> Fixes: 2cc3cd5fdc8b ("ASoC: mediatek: mt8183: support WoV")
> Signed-off-by: Mao Wenan <maowenan@huawei.com>

Acked-by: Tzung-Bi Shih <tzungbi@google.com>

Thanks for the catching.
