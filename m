From: Takashi Iwai <tiwai@suse.de>
Date: Tue, 27 Mar 2018 13:21:20 +0000
Subject: Re: [PATCH] ALSA: pcm: potential uninitialized return values
Message-Id: <s5htvt18xin.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180327130752.GA31841@mwanda>
In-Reply-To: <20180327130752.GA31841@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>, Takashi Sakamoto <o-takashi@sakamocchi.jp>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 27 Mar 2018 15:07:52 +0200,
Dan Carpenter wrote:
> 
> Smatch complains that "tmp" can be uninitialized if we do a zero size
> write.
> 
> Fixes: 02a5d6925cd3 ("ALSA: pcm: Avoid potential races between OSS ioctls and read/write")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, that's an oversight indeed.  Applied now.


Takashi
