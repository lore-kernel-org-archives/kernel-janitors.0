From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 28 Apr 2020 17:21:16 +0000
Subject: Re: [PATCH] dmaengine: qcom_hidma: Simplify error handling path in hidma_probe
Message-Id: <20200428172116.GG2014@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200427111043.70218-1-christophe.jaillet@wanadoo.fr>
 <20200428125426.GE2014@kadam>
 <1efa0186-7fbe-9cb5-2719-2d7192f99e27@kernel.org>
In-Reply-To: <1efa0186-7fbe-9cb5-2719-2d7192f99e27@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sinan Kaya <okaya@kernel.org>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, agross@kernel.org, bjorn.andersson@linaro.org, vkoul@kernel.org, dan.j.williams@intel.com, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

I apologize, I wrote my code hurriedly and did no explain the bug well.
I understood what the code is doing, but my fix was missing an if
condition.

On Tue, Apr 28, 2020 at 12:01:15PM -0400, Sinan Kaya wrote:
> On 4/28/2020 8:54 AM, Dan Carpenter wrote:
> >> @@ -897,7 +897,6 @@ static int hidma_probe(struct platform_device *pdev)
> >>  	if (msi)
> >             ^^^
> > This test doesn't work.  It will call free hidma_free_msis() if the
> > hidma_request_msi() call fails.  We should do:
> > 
> > 	if (msi) {
> > 		rc = hidma_request_msi(dmadev, pdev);
> > 		msi = false;

What I meant to say here was:

	if (msi) {
		rc = hidma_request_msi(dmadev, pdev);
		if (rc)
			msi = false;

Otherwise we end up checking freeing the msi in the error handling
code when we did not take it.

Hopefully, that clears things up?

regards,
dan carpenter
