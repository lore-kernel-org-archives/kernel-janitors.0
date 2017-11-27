From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 27 Nov 2017 19:51:00 +0000
Subject: Re: [PATCH] ALSA: drivers: make array 'names' const, reduces object code size
Message-Id: <s5h8termrff.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171127125851.10076-1-colin.king@canonical.com>
In-Reply-To: <20171127125851.10076-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 27 Nov 2017 13:58:51 +0100,
Colin King wrote:
> 
> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate array 'names' on the stack but instead make them static.
> Makes the object code smaller by 50 bytes:
> 
> Before:
>    text	   data	    bss	    dec	    hex	filename
>   21237	   9192	   1120	  31549	   7b3d	linux/sound/drivers/dummy.o
> 
> After:
>    text	   data	    bss	    dec	    hex	filename
>   21095	   9280	   1120	  31495	   7b07	linux/sound/drivers/dummy.o
> 
> (gcc version 7.2.0 x86_64)
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks.


Takashi
