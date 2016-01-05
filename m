From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 05 Jan 2016 14:03:39 +0000
Subject: Re: [patch v2] usb: gadget: f_midi: missing unlock on error path
Message-Id: <20160105140339.GV5177@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160105102809.GA26420@mwanda>
In-Reply-To: <20160105102809.GA26420@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Jan 05, 2016 at 02:55:31PM +0100, Michal Nazarewicz wrote:
> @@ -568,12 +568,12 @@ static int f_midi_in_open(struct snd_rawmidi_substream *substream)
>  {
>  	struct f_midi *midi = substream->rmidi->private_data;
>  
> -	if (!midi->in_port[substream->number])
> +	if (substream->number > midi->in_ports)

This is off by one.  It should be >= midi->in_ports.

regards,
dan carpenter

