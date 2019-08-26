From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 26 Aug 2019 13:52:14 +0000
Subject: Re: [PATCH] ALSA: usb-audio: remove some dead code
Message-Id: <s5himqkniep.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190826134550.GA8842@mwanda>
In-Reply-To: <20190826134550.GA8842@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: alsa-devel@alsa-project.org, Wenwen Wang <wang6495@umn.edu>, kernel-janitors@vger.kernel.org, Richard Fontana <rfontana@redhat.com>, Hui Peng <benquike@gmail.com>

On Mon, 26 Aug 2019 15:45:50 +0200,
Dan Carpenter wrote:
> 
> We recently cleaned up the error handling in commit 52c3e317a857 ("ALSA:
> usb-audio: Unify the release of usb_mixer_elem_info objects") but
> accidentally left this stray return.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, applied now.


Takashi
