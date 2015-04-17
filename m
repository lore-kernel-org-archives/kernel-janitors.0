From: Takashi Iwai <tiwai@suse.de>
Date: Fri, 17 Apr 2015 13:32:28 +0000
Subject: Re: [patch v2] ALSA: hda - potential (but unlikely) uninitialized variable
Message-Id: <s5htwwex4lv.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <s5h383zx6xu.wl-tiwai@suse.de>
	<20150417131946.GA24502@mwanda>
In-Reply-To: <20150417131946.GA24502@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

At Fri, 17 Apr 2015 16:19:46 +0300,
Dan Carpenter wrote:
> 
> This function is a bit unusual because it accepts negative values as
> "conn_len".  It's theoretically possible for both "cache_len" and
> "conn_len" to be -ENOSPC and in that case we would oops trying to run
> memcmp() on the uninitialized "list" pointer.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: Don't print a negative error code as "In-driver Connection."

Applied, thanks.


Takashi

> 
> diff --git a/sound/pci/hda/hda_proc.c b/sound/pci/hda/hda_proc.c
> index ee62307..2f00886 100644
> --- a/sound/pci/hda/hda_proc.c
> +++ b/sound/pci/hda/hda_proc.c
> @@ -582,8 +582,8 @@ static void print_conn_list(struct snd_info_buffer *buffer,
>  
>  	/* Get Cache connections info */
>  	cache_len = snd_hda_get_conn_list(codec, nid, &list);
> -	if (cache_len != conn_len
> -			|| memcmp(list, conn, conn_len)) {
> +	if (cache_len >= 0 && (cache_len != conn_len ||
> +			      memcmp(list, conn, conn_len) != 0)) {
>  		snd_iprintf(buffer, "  In-driver Connection: %d\n", cache_len);
>  		if (cache_len > 0) {
>  			snd_iprintf(buffer, "    ");
> 
