From: Viresh Kumar <viresh.kumar@linaro.org>
Date: Thu, 10 Aug 2017 08:37:28 +0000
Subject: Re: [PATCH] ASoC: spear: Delete an error message for a failed memory allocation in two functions
Message-Id: <CAOh2x=mbavqBRooKz=v8D1eJ=WqXoCzecqi94szOvnrfrmEf=w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1e377ebe-822c-fca6-d2cd-c27a84ae1566@users.sourceforge.net>
In-Reply-To: <1e377ebe-822c-fca6-d2cd-c27a84ae1566@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: alsa-devel@alsa-project.org, "Gustavo A. R. Silva" <garsilva@embeddedor.com>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Thu, Aug 10, 2017 at 1:37 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 10 Aug 2017 09:50:51 +0200
>
> Omit an extra message for a memory allocation failure in these functions.
>
> This issue was detected by using the Coccinelle software.
>
> Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  sound/soc/spear/spdif_in.c  | 4 +---
>  sound/soc/spear/spdif_out.c | 4 +---
>  2 files changed, 2 insertions(+), 6 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
