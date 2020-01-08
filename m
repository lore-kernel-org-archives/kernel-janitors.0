From: Takashi Iwai <tiwai@suse.de>
Date: Wed, 08 Jan 2020 06:21:16 +0000
Subject: Re: [PATCH] ALSA: control: potential uninitialized return value
Message-Id: <s5hv9pmo4df.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200108053706.h3hcnvmnf62wkjac@kili.mountain>
In-Reply-To: <20200108053706.h3hcnvmnf62wkjac@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Kirill Smelkov <kirr@nexedi.com>, Allison Randal <allison@lohutok.net>

On Wed, 08 Jan 2020 06:37:06 +0100,
Dan Carpenter wrote:
> 
> Smatch complains that "ret" might be uninitialized.
> 
> Fixes: fbd3eb7f66c5 ("ALSA: control: Add verification for kctl accesses")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.


Takashi
