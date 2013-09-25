From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 25 Sep 2013 18:23:59 +0000
Subject: Re: [patch] mwifiex: potential integer underflow in mwifiex_ret_wmm_get_status()
Message-Id: <20130925182359.GV6247@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130925085729.GC6661@elgon.mountain>
 <477F20668A386D41ADCC57781B1F70430F45077CDA@SC-VEXCH1.marvell.com>
In-Reply-To: <477F20668A386D41ADCC57781B1F70430F45077CDA@SC-VEXCH1.marvell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bing Zhao <bzhao@marvell.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Wed, Sep 25, 2013 at 09:25:46AM -0700, Bing Zhao wrote:
> Hi Dan,
> 
> > If "resp_len" gets set to negative then it counts as a high positive value.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> > I spotted this reviewing the int => bool changes, but I don't have the
> > hardware and can't test it.
> 
> Thanks for spotting this potential integer underflow problem.
> 
> I think we can change the 'resp_len' variable type to a signed integer
> to fix this issue.

No, that doesn't work because the comparison against sizeof() get's
promoted to size_t.  In other words, negative values still count as
large positive values.

regards,
dan carpenter

