From: Sinan Kaya <okaya@kernel.org>
Date: Tue, 28 Apr 2020 20:29:49 +0000
Subject: Re: [PATCH] dmaengine: qcom_hidma: Simplify error handling path in hidma_probe
Message-Id: <430381bf-4fa5-80f7-4dcb-9e30d24e57ce@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200427111043.70218-1-christophe.jaillet@wanadoo.fr>
 <20200428125426.GE2014@kadam>
 <1efa0186-7fbe-9cb5-2719-2d7192f99e27@kernel.org>
 <20200428172116.GG2014@kadam>
In-Reply-To: <20200428172116.GG2014@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, agross@kernel.org, bjorn.andersson@linaro.org, vkoul@kernel.org, dan.j.williams@intel.com, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 4/28/2020 1:21 PM, Dan Carpenter wrote:
> What I meant to say here was:
> 
> 	if (msi) {
> 		rc = hidma_request_msi(dmadev, pdev);
> 		if (rc)
> 			msi = false;
> 
> Otherwise we end up checking freeing the msi in the error handling
> code when we did not take it.
> 
> Hopefully, that clears things up?

Yes, that works. However, I'd rather use a different flag for this
in order not to mix the meaning of msi capability vs. msi allocation
failure.
