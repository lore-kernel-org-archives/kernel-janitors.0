From: Jakub Kicinski <jakub.kicinski@netronome.com>
Date: Tue, 23 Jan 2018 02:33:26 +0000
Subject: Re: [PATCH net-next] nfp: fix error return code in nfp_pci_probe()
Message-Id: <20180122183326.229e40c6@cakuba.netronome.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1516673427-170584-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1516673427-170584-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Simon Horman <simon.horman@netronome.com>, David Brunecz <david.brunecz@netronome.com>, oss-drivers@netronome.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, 23 Jan 2018 02:10:27 +0000, Wei Yongjun wrote:
> Fix to return error code -EINVAL instead of 0 when num_vfs above
> limit_vfs, as done elsewhere in this function.
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Acked-by: Jakub Kicinski <jakub.kicinski@netronome.com>

Thanks!  FWIW here is the commit to blame:

Fixes: 0dc786219186 ("nfp: handle SR-IOV already enabled when driver is probing")
