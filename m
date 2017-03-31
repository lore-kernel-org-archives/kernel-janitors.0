From: Takashi Iwai <tiwai@suse.de>
Date: Fri, 31 Mar 2017 15:27:55 +0000
Subject: Re: [PATCH 1/2] ALSA: timer: remove some dead code
Message-Id: <s5hshlt1n5w.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170331152141.GB8141@mwanda>
In-Reply-To: <20170331152141.GB8141@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Kangjie Lu <kangjielu@gmail.com>, kernel-janitors@vger.kernel.org

On Fri, 31 Mar 2017 17:21:41 +0200,
Dan Carpenter wrote:
> 
> We just checked "id.card < 0" on the lines before so we know it's not
> true here.  We can delete that check.
> 
> Also checkpatch.pl complains about some extra curly braces so we may as
> well fix that while we're at it.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.


Takashi
