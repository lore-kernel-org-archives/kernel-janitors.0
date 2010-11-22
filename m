From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Mon, 22 Nov 2010 21:53:58 +0000
Subject: Re: [alsa-devel] [PATCH] ASoC: s3c24xx: test wrong variable
Message-Id: <AANLkTimXOk8FXK5NqbuW9qa6HUt5_4Fgvc+7h8OrJO_j@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1290361223-15211-1-git-send-email-segoon@openwall.com>
	<20101122140002.GB18960@rakim.wolfsonmicro.main>
In-Reply-To: <20101122140002.GB18960@rakim.wolfsonmicro.main>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: alsa-devel@alsa-project.org, Jassi Brar <jassi.brar@samsung.com>, Takashi Iwai <tiwai@suse.de>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Vasiliy Kulikov <segoon@openwall.com>, Liam Girdwood <lrg@slimlogic.co.uk>

On Mon, Nov 22, 2010 at 11:00 PM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> On Sun, Nov 21, 2010 at 08:40:21PM +0300, Vasiliy Kulikov wrote:
>> After clk_get() mclk is checked three times instead of mout_epll
>> and sclk_spdif checks.
>>
>> Signed-off-by: Vasiliy Kulikov <segoon@openwall.com>
>
> Applied, thanks.

Wierd, it is CC to me as well but I didn't receive it.
Though the change is ok.
