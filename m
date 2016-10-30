From: Jarkko Nikula <jarkko.nikula@bitmer.com>
Date: Sun, 30 Oct 2016 10:58:51 +0000
Subject: Re: [PATCH 10/15] ASoC: omap-mcbsp: use permission-specific DEVICE_ATTR variants
Message-Id: <20161030125851.bd0e74854c52ce7d4ab3570c@bitmer.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1477769829-22230-1-git-send-email-Julia.Lawall@lip6.fr>
 <1477769829-22230-11-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1477769829-22230-11-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: alsa-devel@alsa-project.org, linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Mark Brown <broonie@kernel.org>

Hi

On Sat, 29 Oct 2016 21:37:04 +0200
Julia Lawall <Julia.Lawall@lip6.fr> wrote:

> Use DEVICE_ATTR_RW for read-write attributes.  This simplifies the
> source code, improves readbility, and reduces the chance of
> inconsistencies.
> 
...
> 
> - DEVICE_ATTR(x, \(0644\|S_IRUGO|S_IWUSR\), x_show, x_store);
> + DEVICE_ATTR_RW(x);

I'm not so sure does this improve readability. 644 is pretty obvious but for DEVICE_ATTR_RW() one has to dive into include/linux/device.h and include/linux/sysfs.h to see for what users it grants the write access.

-- 
Jarkko
