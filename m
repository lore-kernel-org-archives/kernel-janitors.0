From: Samuel Ortiz <sameo@linux.intel.com>
Date: Sat, 01 Apr 2017 22:19:14 +0000
Subject: Re: [PATCH] NFC: st21nfca: Fix potential memory leak
Message-Id: <20170401221914.GE22034@zurbaran.ger.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170219095847.9397-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170219095847.9397-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: christophe.ricard@gmail.com, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Christophe,

On Sun, Feb 19, 2017 at 10:58:47AM +0100, Christophe JAILLET wrote:
> If all bits of 'dev_mask' are already set, there is a memory leak because
> 'info' should be freed before returning.
> 
> While fixing it, 'return -ENOMEM' directly if the first kzalloc fails.
> This makes the code more readable.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/nfc/st21nfca/core.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
Applied, thanks.

Cheers,
Samuel.
