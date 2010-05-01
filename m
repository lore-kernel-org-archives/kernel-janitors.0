From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Date: Sat, 01 May 2010 10:14:42 +0000
Subject: Re: [PATCH] arm/mach-msm: Add CONFIG conditional for board-trout
Message-Id: <20100501101442.GH12172@n2100.arm.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <201004290241.23068.PeterHuewe@gmx.de>
In-Reply-To: <201004290241.23068.PeterHuewe@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Thu, Apr 29, 2010 at 02:41:22AM +0200, Peter Huewe wrote:
> From: Peter Huewe <peterhuewe@gmx.de>
> 
> This patch adds a conditional for CONFIG_MSM_DEBUG_UART to prevent a
> build failure[1], this is done the same way as for every board in mach-msm.
> 
> References:
> [1] http://kisskb.ellerman.id.au/kisskb/buildresult/2448102/
> 
> Signed-off-by: Peter Huewe <peterhuewe@gmx.de>

Acked-by: Russell King <rmk+kernel@arm.linux.org.uk>

Who's going to deal with getting this patch upstream?
