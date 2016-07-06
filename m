From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Date: Wed, 06 Jul 2016 15:33:32 +0000
Subject: Re: [PATCH] clocksource: cadence_ttc: fix a return value in case of error
Message-Id: <20160706153332.GN19175@xsjsorenbubuntu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1467783323-16632-1-git-send-email-christophe.jaillet@wanadoo.fr>
In-Reply-To: <1467783323-16632-1-git-send-email-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-arm-kernel@lists.infradead.org

On Wed, 2016-07-06 at 07:35:23 +0200, Christophe JAILLET wrote:
> IS_ERR and PTR_ERR should use the same variable, clk_ce in this case.
> 
> Fixes: 4de1eb07c47f (Convert init function to return error)
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Acked-by: Sören Brinkmann <soren.brinkmann@xilinx.com>

	Sören
