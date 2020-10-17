From: Takashi Iwai <tiwai@suse.de>
Date: Sat, 17 Oct 2020 08:05:34 +0000
Subject: Re: [PATCH] ALSA: hda/ca0132: make some const arrays static, makes object smaller
Message-Id: <s5hzh4ll1kh.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201016224913.687724-1-colin.king@canonical.com>
In-Reply-To: <20201016224913.687724-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Connor McAdams <conmanx360@gmail.com>

On Sat, 17 Oct 2020 00:49:13 +0200,
Colin King wrote:
> 
> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate const arrays on the stack but instead make them
> static. Makes the object code smaller by 57 bytes.
> 
> Before:
>    text	   data	    bss	    dec	    hex	filename
>  173256	  38016	    192	 211464	  33a08	sound/pci/hda/patch_ca0132.o
> 
> After:
>    text	   data	    bss	    dec	    hex	filename
>  172879	  38336	    192	 211407	  339cf	sound/pci/hda/patch_ca0132.o
> 
> (gcc version 10.2.0)
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks, applied.


Takashi
