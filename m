From: Takashi Iwai <tiwai@suse.de>
Date: Thu, 05 Sep 2019 17:47:16 +0000
Subject: Re: [PATCH] ALSA: hda/hdmi: remove redundant assignment to variable pcm_idx
Message-Id: <s5h1rwuhbyz.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190905154826.5916-1-colin.king@canonical.com>
In-Reply-To: <20190905154826.5916-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 05 Sep 2019 17:48:26 +0200,
Colin King wrote:
> 
> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable pcm_idx is being initialized with a value that is never read
> and is being re-assigned immediately afterwards. The assignment is
> redundant and hence can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks.


Takashi
