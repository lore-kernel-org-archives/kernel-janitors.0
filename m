From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 19 Jul 2012 17:01:26 +0000
Subject: Re: [PATCH net-next] asix: AX88172A driver depends on phylib
Message-Id: <20120719170126.GA19361@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1342699339-13871-1-git-send-email-christian.riesch@omicron.at>
In-Reply-To: <1342699339-13871-1-git-send-email-christian.riesch@omicron.at>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Riesch <christian.riesch@omicron.at>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Jul 19, 2012 at 02:02:19PM +0200, Christian Riesch wrote:
> Since commit 16626b0cc3d5afe250850f96759b241f8a403b52 the asix
> driver depends on the phylib. Select phylib when the asix driver is
> selected.

Tested-by: Fengguang Wu <fengguang.wu@intel.com>
