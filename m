From: Takashi Iwai <tiwai@suse.de>
Date: Tue, 27 Mar 2018 15:45:46 +0000
Subject: Re: [PATCH] ALSA: usb-audio: fix memory leak on cval
Message-Id: <s5hfu4l8qtx.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180327143001.13870-1-colin.king@canonical.com>
In-Reply-To: <20180327143001.13870-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: alsa-devel@alsa-project.org, Andrew Chant <achant@google.com>, Jaroslav Kysela <perex@perex.cz>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 27 Mar 2018 16:30:01 +0200,
Colin King wrote:
> 
> From: Colin Ian King <colin.king@canonical.com>
> 
> With the current exit return path of the ctl_info allocation failure
> cval is not being freed resulting in a memory leak. Fix this by kfree'ing
> it on the return.
> 
> Detected by CoverityScan, CID#1466878 ("Resource Leak")
> 
> Fixes: 21e9b3e931f7 ("ALSA: usb-audio: fix uac control query argument")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks, applied now.


Takashi
