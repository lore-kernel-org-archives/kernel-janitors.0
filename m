From: Takashi Iwai <tiwai@suse.de>
Date: Thu, 29 Mar 2018 09:11:09 +0000
Subject: Re: [PATCH] ALSA: usb-audio: silence a static checker warning
Message-Id: <s5ho9j76yc2.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180329090319.GB17927@mwanda>
In-Reply-To: <20180329090319.GB17927@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Ruslan Bilovol <ruslan.bilovol@gmail.com>

On Thu, 29 Mar 2018 11:03:19 +0200,
Dan Carpenter wrote:
> 
> We recently made "format" a u64 variable so now static checkers complain
> that this shift will wrap around if format is more than 31.  I don't
> think it makes a difference for runtime, but it's simple to silence the
> warning.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied now.  Thanks.


Takashi
