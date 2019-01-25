From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Date: Fri, 25 Jan 2019 13:41:39 +0000
Subject: Re: [PATCH] ALSA: fireface: Off by one in latter_handle_midi_msg()
Message-Id: <20190125134139.GA20650@workstation>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190125124418.GA21947@kadam>
In-Reply-To: <20190125124418.GA21947@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Clemens Ladisch <clemens@ladisch.de>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>

On Fri, Jan 25, 2019 at 03:44:18PM +0300, Dan Carpenter wrote:
> The > should be >= or otherwise we potentially read one element beyond
> the end of the ff->tx_midi_substreams[] array.
> 
> Fixes: 73f5537fb209 ("ALSA: fireface: support tx MIDI functionality of Fireface UCX")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  sound/firewire/fireface/ff-protocol-latter.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/firewire/fireface/ff-protocol-latter.c b/sound/firewire/fireface/ff-protocol-latter.c
> index 817af4447349..438aeed9a1ab 100644
> --- a/sound/firewire/fireface/ff-protocol-latter.c
> +++ b/sound/firewire/fireface/ff-protocol-latter.c
> @@ -275,7 +275,7 @@ static void latter_handle_midi_msg(struct snd_ff *ff, unsigned int offset,
>  	struct snd_rawmidi_substream *substream;
>  	unsigned int len;
>  
> -	if (index > ff->spec->midi_in_ports)
> +	if (index >= ff->spec->midi_in_ports)
>  		return;
>  
>  	switch (data & 0x0000000f) {
> -- 
> 2.17.1
 
Indeed. The value of index is picked up from quadlet data transferred by
device. The range of value is expected to be 0x00 or 0x01, thus this patch is
correct.

Reviewed-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>


Thanks

Takashi Sakamoto
