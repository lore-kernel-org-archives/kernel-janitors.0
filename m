From: David Miller <davem@davemloft.net>
Date: Wed, 15 Jan 2020 22:06:40 +0000
Subject: Re: [PATCH] net/wan/fsl_ucc_hdlc: fix out of bounds write on array utdm_info
Message-Id: <20200115.140640.367212385869999160.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200114145448.361888-1-colin.king@canonical.com>
In-Reply-To: <20200114145448.361888-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, qiang.zhao@nxp.com

From: Colin King <colin.king@canonical.com>
Date: Tue, 14 Jan 2020 14:54:48 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> Array utdm_info is declared as an array of MAX_HDLC_NUM (4) elements
> however up to UCC_MAX_NUM (8) elements are potentially being written
> to it.  Currently we have an array out-of-bounds write error on the
> last 4 elements. Fix this by making utdm_info UCC_MAX_NUM elements in
> size.
> 
> Addresses-Coverity: ("Out-of-bounds write")
> Fixes: c19b6d246a35 ("drivers/net: support hdlc function for QE-UCC")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied and queued up for -stable.
