From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 27 Aug 2018 09:29:29 +0000
Subject: Re: [PATCH] ALSA: pcm: signedness bug in snd_pcm_plug_alloc()
Message-Id: <s5ho9do88ee.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180827092144.5oj6obfb3zabp5us@kili.mountain>
In-Reply-To: <20180827092144.5oj6obfb3zabp5us@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: alsa-devel@alsa-project.org, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, kernel-janitors@vger.kernel.org

On Mon, 27 Aug 2018 11:21:45 +0200,
Dan Carpenter wrote:
> 
> The "frames" variable is unsigned so the error handling doesn't work
> properly.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.


Takashi
