From: Takashi Iwai <tiwai@suse.de>
Date: Wed, 03 Mar 2010 21:51:22 +0000
Subject: Re: [patch] riptide: clean up while loop
Message-Id: <s5hsk8hm5ut.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100303071349.GG5086@bicker>
In-Reply-To: <20100303071349.GG5086@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

At Wed, 3 Mar 2010 10:13:49 +0300,
Dan Carpenter wrote:
> 
> If getpaths() returned an odd number this would be a buffer under-run and an 
> endless loop.  It turns out that getpaths() can only return even numbers, but 
> let's make it easy for people auditing code.  With the new code you don't 
> need to look at getpaths().
> 
> This silences a smatch warning.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied now.  Thanks.


Takashi

> diff --git a/sound/pci/riptide/riptide.c b/sound/pci/riptide/riptide.c
> index e66ef2b..a5924af 100644
> --- a/sound/pci/riptide/riptide.c
> +++ b/sound/pci/riptide/riptide.c
> @@ -1974,9 +1974,9 @@ snd_riptide_proc_read(struct snd_info_entry *entry,
>  	}
>  	snd_iprintf(buffer, "Paths:\n");
>  	i = getpaths(cif, p);
> -	while (i--) {
> -		snd_iprintf(buffer, "%x->%x ", p[i - 1], p[i]);
> -		i--;
> +	while (i >= 2) {
> +		i -= 2;
> +		snd_iprintf(buffer, "%x->%x ", p[i], p[i + 1]);
>  	}
>  	snd_iprintf(buffer, "\n");
>  }
> 
