From: Axel Lin <axel.lin@ingics.com>
Date: Thu, 25 Feb 2016 08:18:37 +0000
Subject: Re: [patch 2/2] ASoC: max9867: silence and array overflow warning
Message-Id: <CAFRkauDgp3B=HXkd3dcZ0dwhGEg+KfYdgfK5Sfr9B_pi5x-G=g@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160225075038.GC7333@mwanda>
In-Reply-To: <20160225075038.GC7333@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, anish kumar <yesanishhere@gmail.com>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

2016-02-25 15:50 GMT+08:00 Dan Carpenter <dan.carpenter@oracle.com>:
> Smatch complains that we might reach the end of this loop without
> finding what we're looking for leading to a buffer overflow.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Reviewed-by: Axel Lin <axel.lin@ingics.com>
