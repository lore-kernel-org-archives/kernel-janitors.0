From: Takashi Iwai <tiwai@suse.de>
Date: Wed, 22 Apr 2020 09:29:42 +0000
Subject: Re: [PATCH] ALSA: usb-audio: Fix a limit check in proc_dump_substream_formats()
Message-Id: <s5h8sin27i1.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200422092255.GB195357@mwanda>
In-Reply-To: <20200422092255.GB195357@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Allison Randal <allison@lohutok.net>

On Wed, 22 Apr 2020 11:22:55 +0200,
Dan Carpenter wrote:
> 
> This should be ARRAY_SIZE() instead of sizeof().  The sizeof() limit is
> too high so it doesn't work.
> 
> Fixes: 093b8494f299 ("ALSA: usb-audio: Print more information in stream proc files")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, applied.


Takashi
