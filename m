From: Takashi Iwai <tiwai@suse.de>
Date: Wed, 14 May 2014 14:48:01 +0000
Subject: Re: [patch] ALSA: hda - if statement not indented
Message-Id: <s5hd2fgh0wu.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140514141831.GA18082@mwanda>
In-Reply-To: <20140514141831.GA18082@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jaroslav Kysela <perex@perex.cz>, David Henningsson <david.henningsson@canonical.com>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

At Wed, 14 May 2014 17:18:31 +0300,
Dan Carpenter wrote:
> 
> The "break;" should be indented.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.


Takashi

> 
> diff --git a/sound/pci/hda/hda_generic.c b/sound/pci/hda/hda_generic.c
> index 1613388..589e47c 100644
> --- a/sound/pci/hda/hda_generic.c
> +++ b/sound/pci/hda/hda_generic.c
> @@ -3722,7 +3722,7 @@ static void parse_digital(struct hda_codec *codec)
>  		} else {
>  			spec->multiout.slave_dig_outs = spec->slave_dig_outs;
>  			if (nums >= ARRAY_SIZE(spec->slave_dig_outs) - 1)
> -			break;
> +				break;
>  			spec->slave_dig_outs[nums - 1] = dig_nid;
>  		}
>  		nums++;
> 
