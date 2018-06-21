From: Takashi Iwai <tiwai@suse.de>
Date: Thu, 21 Jun 2018 09:04:16 +0000
Subject: Re: [PATCH] ALSA: lx6464es: Missing error code in snd_lx6464es_create()
Message-Id: <s5hd0wklddb.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180620204256.wvesr47qgikwhfgq@kili.mountain>
In-Reply-To: <20180620204256.wvesr47qgikwhfgq@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, alsa-devel@alsa-project.org, Zhouyang Jia <jiazhouyang09@gmail.com>, Bhumika Goyal <bhumirks@gmail.com>

On Thu, 21 Jun 2018 10:07:21 +0200,
Dan Carpenter wrote:
> 
> We forgot to set the error code on this error path.
> 
> Fixes: 4a23fc8cc068 ("ALSA: lx6464es: add error handling for pci_ioremap_bar")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, applied.


Takashi
