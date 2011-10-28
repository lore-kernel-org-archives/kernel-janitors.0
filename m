From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 28 Oct 2011 06:45:25 +0000
Subject: Re: [patch] [ALSA] hwdep: silence integer overflow warning
Message-Id: <20111028064525.GA14707@longonot.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111020060910.GA6101@elgon.mountain>
 <4E9FD02B.6030307@bfs.de>
In-Reply-To: <4E9FD02B.6030307@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: walter harms <wharms@bfs.de>
Cc: Takashi Iwai <tiwai@suse.de>, Paul Gortmaker <paul.gortmaker@windriver.com>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

On Thu, Oct 20, 2011 at 09:39:23AM +0200, walter harms wrote:
> I am not sure how SNDRV_MINOR_HWDEPS is used further

Either device = SNDRV_MINOR_HWDEPS or device = SNDRV_MINOR_HWDEPS + 1
are fine (equivalent) but it's a fair point.  Your version is nicer.

I'll redo the patch.

regards,
dan carpenter

