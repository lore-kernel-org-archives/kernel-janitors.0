From: David Miller <davem@davemloft.net>
Date: Thu, 19 Jul 2012 17:50:35 +0000
Subject: Re: [PATCH net-next] asix: AX88172A driver depends on phylib
Message-Id: <20120719.105035.1388174968455315721.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1342699339-13871-1-git-send-email-christian.riesch@omicron.at>
In-Reply-To: <1342699339-13871-1-git-send-email-christian.riesch@omicron.at>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christian.riesch@omicron.at
Cc: netdev@vger.kernel.org, fengguang.wu@intel.com, kernel-janitors@vger.kernel.org

From: Christian Riesch <christian.riesch@omicron.at>
Date: Thu, 19 Jul 2012 14:02:19 +0200

> Since commit 16626b0cc3d5afe250850f96759b241f8a403b52 the asix
> driver depends on the phylib. Select phylib when the asix driver is
> selected.
> 
> Reported-by: Fengguang Wu <fengguang.wu@intel.com>
> Cc: kernel-janitors@vger.kernel.org
> Signed-off-by: Christian Riesch <christian.riesch@omicron.at>

Applied.
