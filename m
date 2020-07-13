From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 13 Jul 2020 16:05:06 +0000
Subject: Re: [PATCH] ALSA: echoaudio: re-enable IRQs on failure path
Message-Id: <s5hy2nnwgct.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200713105324.GB251988@mwanda>
In-Reply-To: <20200713105324.GB251988@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Chuhong Yuan <hslester96@gmail.com>, Takashi Iwai <tiwai@suse.com>, Mark Hills <mark@xwax.org>

On Mon, 13 Jul 2020 12:53:24 +0200,
Dan Carpenter wrote:
> 
> This should be spin_unlock_irq() instead of spin_lock().
> 
> Fixes: 6c3312544873 ("ALSA: echoaudio: Prevent races in calls to set_audio_format()")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, applied now.


Takashi
