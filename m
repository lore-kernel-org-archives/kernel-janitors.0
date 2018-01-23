From: David Miller <davem@davemloft.net>
Date: Tue, 23 Jan 2018 15:43:48 +0000
Subject: Re: [PATCH net-next] nfp: fix error return code in nfp_pci_probe()
Message-Id: <20180123.104348.14959653350851249.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1516673427-170584-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1516673427-170584-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: weiyongjun1@huawei.com
Cc: jakub.kicinski@netronome.com, simon.horman@netronome.com, david.brunecz@netronome.com, oss-drivers@netronome.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Tue, 23 Jan 2018 02:10:27 +0000

> Fix to return error code -EINVAL instead of 0 when num_vfs above
> limit_vfs, as done elsewhere in this function.
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied, thank you.
