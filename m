From: Vinod Koul <vkoul@kernel.org>
Date: Mon, 02 Mar 2020 10:21:45 +0000
Subject: Re: [PATCH][next] dmaengine: ti: edma: fix null dereference because of a typo in pointer name
Message-Id: <20200302100945.GL4148@vkoul-mobl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200226185921.351693-1-colin.king@canonical.com>
In-Reply-To: <20200226185921.351693-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Dan Williams <dan.j.williams@intel.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, dmaengine@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 26-02-20, 18:59, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently there is a dereference of the null pointer m_ddev.  This appears
> to be a typo on the pointer, I believe s_ddev should be used instead.
> Fix this by using the correct pointer.

Applied, thanks

-- 
~Vinod
