From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 22 Jan 2021 07:27:25 +0000
Subject: Re: [PATCH 1/2] ALSA: oxfw: fix info leak in hwdep_read()
Message-Id: <20210122072725.GJ20820@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <YAkassrrWUtsW6aZ@mwanda>
In-Reply-To: <YAkassrrWUtsW6aZ@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Clemens Ladisch <clemens@ladisch.de>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>

Please ignore this one.  Christophe JAILLET pointed out that the info
leak isn't possible.  I'll send a clean up patch instead.

regards,
dan carpenter
