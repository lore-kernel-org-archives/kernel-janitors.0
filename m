From: Daniel Mack <zonque@gmail.com>
Date: Tue, 18 Oct 2011 08:27:42 +0000
Subject: Re: [patch 1/2 -next] USB: gadget: midi: fix range check in f_midi_out_open()
Message-Id: <4E9D387E.9090907@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111018062436.GL27732@elgon.mountain>
In-Reply-To: <20111018062436.GL27732@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 18.10.11 08:24, Dan Carpenter wrote:
> ! has higher precedence than>= and since neither 0 nor 1 are greater
> than 8 the condition is always false.

Sure. The call in question actually not more than a sanity check, as 
lower layers will never call this function with an invalid substream number.

Thanks for spotting this.

> Signed-off-by: Dan Carpenter<dan.carpenter@oracle.com>

Acked-by: Daniel Mack <zonque@gmail.com>



>
> diff --git a/drivers/usb/gadget/f_midi.c b/drivers/usb/gadget/f_midi.c
> index 44858dc..ef1bc7a 100644
> --- a/drivers/usb/gadget/f_midi.c
> +++ b/drivers/usb/gadget/f_midi.c
> @@ -644,7 +644,7 @@ static int f_midi_out_open(struct snd_rawmidi_substream *substream)
>   {
>   	struct f_midi *midi = substream->rmidi->private_data;
>
> -	if (!substream->number>= MAX_PORTS)
> +	if (substream->number>= MAX_PORTS)
>   		return -EINVAL;
>
>   	VDBG(midi, "%s()\n", __func__);

