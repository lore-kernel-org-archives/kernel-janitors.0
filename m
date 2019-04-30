From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 30 Apr 2019 09:35:26 +0000
Subject: Re: [PATCH -next] serial: milbeaut_usio: Fix error handling in probe and remove
Message-Id: <20190430093526.GB2269@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190425151044.105045-1-weiyongjun1@huawei.com>
In-Reply-To: <20190425151044.105045-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Apr 25, 2019 at 03:10:44PM +0000, Wei Yongjun wrote:
> devm_clk_get() is used so there is no reason to explicitly call
> clk_put() in probe or remove functions.

Your patch is correct, but next time the patch description should be
more clear that this is a double free.  To me the patch description
sounded like it was just tidying up or something instead of fixing a
crash.  It might feel rude to say that the original code will crash, but
we are all human so introducing crashing bugs is not something to be
embarrassed about.

regards,
dan carpenter
