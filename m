From: David Miller <davem@davemloft.net>
Date: Thu, 13 Sep 2018 03:33:56 +0000
Subject: Re: [PATCH net-next] qlcnic: Remove set but not used variables 'fw_mbx' and 'hdr_size'
Message-Id: <20180912.203356.1125227812671410666.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1536666689-3906-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1536666689-3906-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: yuehaibing@huawei.com
Cc: harish.patil@cavium.com, manish.chopra@cavium.com, Dept-GELinuxNICDev@cavium.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: YueHaibing <yuehaibing@huawei.com>
Date: Tue, 11 Sep 2018 11:51:29 +0000

> From: Yue Haibing <yuehaibing@huawei.com>
> 
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/net/ethernet/qlogic/qlcnic/qlcnic_sriov_common.c: In function 'qlcnic_sriov_pull_bc_msg':
> drivers/net/ethernet/qlogic/qlcnic/qlcnic_sriov_common.c:907:6: warning:
>  variable 'fw_mbx' set but not used [-Wunused-but-set-variable]
> 
> drivers/net/ethernet/qlogic/qlcnic/qlcnic_sriov_common.c: In function 'qlcnic_sriov_issue_bc_post':
> drivers/net/ethernet/qlogic/qlcnic/qlcnic_sriov_common.c:939:16: warning:
>  variable 'hdr_size' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Yue Haibing <yuehaibing@huawei.com>

Applied, thanks.
