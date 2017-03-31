From: Takashi Iwai <tiwai@suse.de>
Date: Fri, 31 Mar 2017 15:28:06 +0000
Subject: Re: [PATCH 2/2] ALSA: timer: Info leak in snd_timer_user_tinterrupt()
Message-Id: <s5hr31d1n5l.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170331152223.GC8141@mwanda>
In-Reply-To: <20170331152223.GC8141@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Kangjie Lu <kangjielu@gmail.com>, Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org, Alexandre Belloni <alexandre.belloni@free-electrons.com>, kernel-janitors@vger.kernel.org

On Fri, 31 Mar 2017 17:22:23 +0200,
Dan Carpenter wrote:
> 
> The "r1" struct has memory holes.  We clear it with memset on one path
> where it is used but not the other.  Let's just memset it at the start
> of the function so it's always safe.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.


Takashi
