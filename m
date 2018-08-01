From: Takashi Iwai <tiwai@suse.de>
Date: Wed, 01 Aug 2018 12:01:25 +0000
Subject: Re: [PATCH 4/9] ALSA: ens137x: remove redundant array pcm_devs
Message-Id: <s5hd0v2nvmy.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180801104742.4328-1-colin.king@canonical.com>
 <20180801104742.4328-5-colin.king@canonical.com>
In-Reply-To: <20180801104742.4328-5-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: alsa-devel@alsa-project.org, Olivier Moysan <olivier.moysan@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, kernel-janitors@vger.kernel.org, Arnaud Pouliquen <arnaud.pouliquen@st.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jaya Kumar <jayakumar.alsa@gmail.com>

On Wed, 01 Aug 2018 12:47:37 +0200,
Colin King wrote:
> 
> From: Colin Ian King <colin.king@canonical.com>
> 
> The array pcm_devs is being assigned but is never used hence it is
> redundant and can be removed.
> 
> Cleans up clang warning:
> warning: variable 'pcm_devs' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks.


Takashi
