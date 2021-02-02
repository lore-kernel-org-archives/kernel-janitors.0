From: Jakub Kicinski <kuba@kernel.org>
Date: Tue, 02 Feb 2021 16:47:46 +0000
Subject: Re: [PATCH net] net: ipa: pass correct dma_handle to dma_free_coherent()
Message-Id: <20210202084746.28c12d20@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <YBjpTU2oejkNIULT@mwanda>
        <cc689bd3-90d8-5ad5-661b-e2c3b76c7341@ieee.org>
In-Reply-To: <cc689bd3-90d8-5ad5-661b-e2c3b76c7341@ieee.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Elder <elder@ieee.org>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alex Elder <elder@kernel.org>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, 2 Feb 2021 05:48:11 -0600 Alex Elder wrote:
> On 2/1/21 11:55 PM, Dan Carpenter wrote:
> > The "ring->addr = addr;" assignment is done a few lines later so we
> > can't use "ring->addr" yet.  The correct dma_handle is "addr".
> > 
> > Fixes: 650d1603825d ("soc: qcom: ipa: the generic software interface")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>  
> 
> Yikes.  Thank you for the fix.
> 
> Reviewed-by: Alex Elder <elder@linaro.org>

Applied, thanks!
