From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Date: Sun, 26 Sep 2010 10:31:38 +0000
Subject: Re: [PATCH 07/24] ieee802154: change to new flag variable
Message-Id: <AANLkTik1ngVjK9ZObC_BfS6Cb-b5trcCAGk2i26TgEz_@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <9968d4260be8850200cc9c7dfe08addf611468b4.1285355033.git.mfm@muteddisk.com>
	<036514b5dd23c5af14303519d79d60d79adccbee.1285355033.git.mfm@muteddisk.com>
	<ffbd189ef2d414ea7c87ffe2b40fce87877dc014.1285355033.git.mfm@muteddisk.com>
	<b3e2061e1e6703f7b84c0484030e07de6000546a.1285355033.git.mfm@muteddisk.com>
	<e0bdab5d2e8c52041c003de68ba774c3e706716c.1285355033.git.mfm@muteddisk.com>
	<70fe6b462b3ee22922698a12d62d650cf029033a.1285355033.git.mfm@muteddisk.com>
	<40a2d76d013ad025d08a411992af10f6bbef0a13.1285355033.git.mfm@muteddisk.com>
In-Reply-To: <40a2d76d013ad025d08a411992af10f6bbef0a13.1285355033.git.mfm@muteddisk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: matt mooney <mfm@muteddisk.com>
Cc: kernel-janitors@vger.kernel.org, Sergey Lapin <slapin@ossfans.org>, linux-zigbee-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org

On 9/24/10, matt mooney <mfm@muteddisk.com> wrote:
> Replace EXTRA_CFLAGS with ccflags-y.
>
> Signed-off-by: matt mooney <mfm@muteddisk.com>
Acked-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>

> ---
>  drivers/ieee802154/Makefile |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)


-- 
With best wishes
Dmitry
