From: Vinod Koul <vkoul@kernel.org>
Date: Wed, 05 Dec 2018 08:20:04 +0000
Subject: Re: [PATCH] dmaengine: dmatest: fix a small memory leak in dmatest_func()
Message-Id: <20181205080804.GD2847@vkoul-mobl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181203144933.uwkmm2sjs434t322@kili.mountain>
In-Reply-To: <20181203144933.uwkmm2sjs434t322@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alexandru Ardelean <alexandru.ardelean@analog.com>, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 03-12-18, 17:49, Dan Carpenter wrote:
> We recently moved the test size tests around but it means we need to
> adjust the error handling as well or we leak the "pq_coefs" memory.  I
> updated the label name to reflect that we're freeing coefs.

Applied, thanks

-- 
~Vinod
