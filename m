From: Vinod Koul <vkoul@kernel.org>
Date: Mon, 21 Dec 2020 14:38:47 +0000
Subject: Re: [PATCH] dmaengine: milbeaut-xdmac: Fix a resource leak in the error handling path of the probe f
Message-Id: <20201221142647.GE3323@vkoul-mobl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201219132800.183254-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20201219132800.183254-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: dan.j.williams@intel.com, jaswinder.singh@linaro.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 19-12-20, 14:28, Christophe JAILLET wrote:
> 'disable_xdmac()' should be called in the error handling path of the
> probe function to undo a previous 'enable_xdmac()' call, as already
> done in the remove function.

Applied, thanks

-- 
~Vinod
