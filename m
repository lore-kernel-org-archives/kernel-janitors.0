From: Tejun Heo <tj@kernel.org>
Date: Mon, 30 Mar 2015 17:17:16 +0000
Subject: Re: [patch] sata_dwc_460ex: indent an if statement
Message-Id: <20150330171716.GA9974@htj.duckdns.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150330103025.GA27144@mwanda>
In-Reply-To: <20150330103025.GA27144@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-ide@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Mar 30, 2015 at 01:30:25PM +0300, Dan Carpenter wrote:
> We shuffled some code around in 8b3444852a2b ('sata_dwc_460ex: move to
> generic DMA driver') an accidentally deleted a tab character here.  It
> causes a Smatch warning "if statement not indented".
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to libata/for-4.1.

Thanks.

-- 
tejun
