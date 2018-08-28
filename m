From: Takashi Iwai <tiwai@suse.de>
Date: Tue, 28 Aug 2018 09:09:08 +0000
Subject: Re: [PATCH] [ALSA] seq: add error check in snd_seq_system_client_init()
Message-Id: <s5h7eka7t8r.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180828084634.5tlvwgc6znrqixro@kili.mountain>
In-Reply-To: <20180828084634.5tlvwgc6znrqixro@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

On Tue, 28 Aug 2018 10:46:34 +0200,
Dan Carpenter wrote:
> 
> Static checkers complain that snd_seq_create_kernel_client() can return
> -EBUSY here so we need to have some error handling.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.

Also we need to fix the case where an error is returned from
snd_seq_kernel_client_ctl().  Will write up the patch soon later.


Takashi
