From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 12 Mar 2018 15:06:58 +0000
Subject: Re: [PATCH] echoaudio: remove redundant initialization of pointer 'pipe'
Message-Id: <s5h8tax49kd.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180312150100.8089-1-colin.king@canonical.com>
In-Reply-To: <20180312150100.8089-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Takashi Sakamoto <o-takashi@sakamocchi.jp>, Arvind Yadav <arvind.yadav.cs@gmail.com>

On Mon, 12 Mar 2018 16:01:00 +0100,
Colin King wrote:
> 
> From: Colin Ian King <colin.king@canonical.com>
> 
> The pointer 'pipe' is being initialized with a value that is never
> read and it is re-assigned later, hence the initialization is redundant
> and can be removed. Also remove pointer 'runtime' as it is no longer
> required.
> 
> Cleans up clang warning:
> sound/pci/echoaudio/echoaudio.c:740:20: warning: Value stored to 'pipe'
> during its initialization is never read
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks.


Takashi
