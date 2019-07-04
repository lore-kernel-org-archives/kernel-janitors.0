From: Takashi Iwai <tiwai@suse.de>
Date: Thu, 04 Jul 2019 13:17:01 +0000
Subject: Re: [PATCH] ALSA: hda/ca0132 - remove redundant assignment to variable 'changed'
Message-Id: <s5hmuhu0wj6.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190704124425.2142-1-colin.king@canonical.com>
In-Reply-To: <20190704124425.2142-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: alsa-devel@alsa-project.org, Connor McAdams <conmanx360@gmail.com>, Jaroslav Kysela <perex@perex.cz>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 04 Jul 2019 14:44:25 +0200,
Colin King wrote:
> 
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable 'changed' is being initialized with a value that is never
> read and it is being updated later with a new value. The initialization
> is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks.


Takashi
