From: Takashi Iwai <tiwai@suse.de>
Date: Wed, 01 Aug 2018 12:01:04 +0000
Subject: Re: [PATCH 2/9] ALSA: cs5535audio: remove redundant pointer 'dma'
Message-Id: <s5hftzynvnj.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180801104742.4328-1-colin.king@canonical.com>
        <20180801104742.4328-3-colin.king@canonical.com>
In-Reply-To: <20180801104742.4328-3-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: alsa-devel@alsa-project.org, Jaya Kumar <jayakumar.alsa@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org, Jaroslav Kysela <perex@perex.cz>, Alexandre Torgue <alexandre.torgue@st.com>, Arnaud Pouliquen <arnaud.pouliquen@st.com>, Olivier Moysan <olivier.moysan@st.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 01 Aug 2018 12:47:35 +0200,
Colin King wrote:
> 
> From: Colin Ian King <colin.king@canonical.com>
> 
> Pointer 'dma' is being assigned but is never used hence it is
> redundant and can be removed.
> 
> Cleans up two clang warnings:
> warning: variable 'dma' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks.


Takashi
