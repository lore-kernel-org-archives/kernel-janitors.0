From: Vinod Koul <vkoul@kernel.org>
Date: Mon, 08 Feb 2021 12:22:03 +0000
Subject: Re: [PATCH][next] dmaengine: dw-axi-dmac: remove redundant null check on desc
Message-Id: <20210208121003.GE879029@vkoul-mobl.Dlink>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210203134652.22618-1-colin.king@canonical.com>
In-Reply-To: <20210203134652.22618-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Sia Jee Heng <jee.heng.sia@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, dmaengine@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 03-02-21, 13:46, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The pointer desc is being null checked twice, the second null check
> is redundant because desc has not been re-assigned between the
> checks. Remove the redundant second null check on desc.

Applied, thanks

-- 
~Vinod
