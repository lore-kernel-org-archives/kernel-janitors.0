From: Takashi Iwai <tiwai@suse.de>
Date: Wed, 01 Aug 2018 12:01:48 +0000
Subject: Re: [PATCH 8/9] ALSA: usb-audio: remove redundant pointer 'urb'
Message-Id: <s5ha7q6nvmb.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180801104742.4328-1-colin.king@canonical.com>
        <20180801104742.4328-9-colin.king@canonical.com>
In-Reply-To: <20180801104742.4328-9-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: alsa-devel@alsa-project.org, Jaya Kumar <jayakumar.alsa@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org, Jaroslav Kysela <perex@perex.cz>, Alexandre Torgue <alexandre.torgue@st.com>, Arnaud Pouliquen <arnaud.pouliquen@st.com>, Olivier Moysan <olivier.moysan@st.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 01 Aug 2018 12:47:41 +0200,
Colin King wrote:
> 
> From: Colin Ian King <colin.king@canonical.com>
> 
> Pointer 'urb' is being assigned but is never used hence it is
> redundant and can be removed.
> 
> Cleans up clang warning:
> warning: variable 'urb' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks.


Takashi
