From: Vinod Koul <vkoul@kernel.org>
Date: Mon, 27 Apr 2020 16:20:36 +0000
Subject: Re: [PATCH] dmaengine: qcom_hidma: Simplify error handling path in hidma_probe
Message-Id: <20200427160836.GI56386@vkoul-mobl.Dlink>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200427111043.70218-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200427111043.70218-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: okaya@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org, dan.j.williams@intel.com, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 27-04-20, 13:10, Christophe JAILLET wrote:
> There is no need to call 'hidma_debug_uninit()' in the error handling
> path. 'hidma_debug_init()' has not been called yet.

Applied, thanks

-- 
~Vinod
