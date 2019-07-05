From: Jakub Kicinski <jakub.kicinski@netronome.com>
Date: Fri, 05 Jul 2019 16:21:46 +0000
Subject: Re: [PATCH net-next] nfp: tls: fix error return code in nfp_net_tls_add()
Message-Id: <20190705092146.6d9b183f@cakuba.netronome.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190705082625.168515-1-weiyongjun1@huawei.com>
In-Reply-To: <20190705082625.168515-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Dirk van der Merwe <dirk.vandermerwe@netronome.com>, oss-drivers@netronome.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, 5 Jul 2019 08:26:25 +0000, Wei Yongjun wrote:
> Fix to return negative error code -EINVAL from the error handling
> case instead of 0, as done elsewhere in this function.
> 
> Fixes: 1f35a56cf586 ("nfp: tls: add/delete TLS TX connections")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Acked-by: Jakub Kicinski <jakub.kicinski@netronome.com>
