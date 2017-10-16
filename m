From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 16 Oct 2017 12:49:15 +0000
Subject: Re: [PATCH] ALSA: 6fire: remove unused variable card
Message-Id: <s5h1sm31cms.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171016123558.12928-1-colin.king@canonical.com>
In-Reply-To: <20171016123558.12928-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Arvind Yadav <arvind.yadav.cs@gmail.com>, Markus Elfring <elfring@users.sourceforge.net>

On Mon, 16 Oct 2017 14:35:58 +0200,
Colin King wrote:
> 
> From: Colin Ian King <colin.king@canonical.com>
> 
> The pointer card is being assigned a value but it is never used.
> Remove this redundant variable. Cleans up clang warning:
> Value stored to 'card' is never read
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks, applied.


Takashi
