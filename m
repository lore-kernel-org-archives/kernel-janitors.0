From: Takashi Iwai <tiwai@suse.de>
Date: Wed, 07 Oct 2020 15:34:49 +0000
Subject: Re: [PATCH] ALSA: bebob: potential info leak in hwdep_read()
Message-Id: <s5h4kn6123q.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201007074928.GA2529578@mwanda>
In-Reply-To: <20201007074928.GA2529578@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: alsa-devel@alsa-project.org, Clemens Ladisch <clemens@ladisch.de>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>

On Wed, 07 Oct 2020 09:49:28 +0200,
Dan Carpenter wrote:
> 
> The "count" variable needs to be capped on every path so that we don't
> copy too much information to the user.
> 
> Fixes: 618eabeae711 ("ALSA: bebob: Add hwdep interface")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied now.  Thanks.


Takashi
