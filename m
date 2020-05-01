From: David Miller <davem@davemloft.net>
Date: Fri, 01 May 2020 03:29:24 +0000
Subject: Re: [PATCH net-next] ice: Fix error return code in ice_add_prof()
Message-Id: <20200430.202924.285425895831692651.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200427121228.12241-1-weiyongjun1@huawei.com>
In-Reply-To: <20200427121228.12241-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: weiyongjun1@huawei.com
Cc: jeffrey.t.kirsher@intel.com, anthony.l.nguyen@intel.com, intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Mon, 27 Apr 2020 12:12:28 +0000

> Fix to return a error code from the error handling case
> instead of 0, as done elsewhere in this function.
> 
> Fixes: 31ad4e4ee1e4 ("ice: Allocate flow profile")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied, thanks.
