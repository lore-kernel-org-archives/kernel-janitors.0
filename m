From: Takashi Iwai <tiwai@suse.de>
Date: Fri, 05 Jun 2020 15:57:04 +0000
Subject: Re: [PATCH] ALSA: emu10k1: delete an unnecessary condition
Message-Id: <s5hbllx7bfz.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200605110134.GC978434@mwanda>
In-Reply-To: <20200605110134.GC978434@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Hariprasad Kelam <hariprasad.kelam@gmail.com>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org

On Fri, 05 Jun 2020 13:01:34 +0200,
Dan Carpenter wrote:
> 
> The "val" variable is an unsigned int so it's always <= UINT_MAX.  This
> check is always true so it can be removed.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.


Takashi
