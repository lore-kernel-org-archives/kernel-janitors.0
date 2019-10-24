From: Curtis Malainey <cujomalainey@google.com>
Date: Thu, 24 Oct 2019 17:15:48 +0000
Subject: Re: [PATCH][next] ASoC: rt5677: Add missing null check for failed allocation of rt5677_dsp
Message-Id: <CAOReqxhzYnN4vkoiJ1vDN3UwmkJs--u7cUgpoSDtMr1dSThR3Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191024124610.18182-1-colin.king@canonical.com>
In-Reply-To: <20191024124610.18182-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Oder Chiou <oder_chiou@realtek.com>, ALSA development <alsa-devel@alsa-project.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Ben Zhang <benzh@chromium.org>, Mark Brown <broonie@kernel.org>, Bard Liao <bardliao@realtek.com>, Curtis Malainey <cujomalainey@chromium.org>

On Thu, Oct 24, 2019 at 5:46 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The allocation of rt5677_dsp can potentially fail and return null, so add
> a null check and return -ENOMEM on a memory allocation failure.
>
> Addresses-Coverity: ("Dereference null return")
> Fixes: a0e0d135427c ("ASoC: rt5677: Add a PCM device for streaming hotword via SPI")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
Thanks

Acked-by Curtis Malainey <cujomalainey@chromium.org>
> ---
>  sound/soc/codecs/rt5677-spi.c | 2 ++
>  1 file changed, 2 insertions(+)
