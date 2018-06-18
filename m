From: Tejun Heo <tj@kernel.org>
Date: Mon, 18 Jun 2018 18:31:36 +0000
Subject: Re: [PATCH -next] ata: ahci_mvebu: ahci_mvebu_stop_engine() can be static
Message-Id: <20180618183136.GC1351649@devbig577.frc2.facebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1528268194-106788-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1528268194-106788-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Jun 06, 2018 at 06:56:34AM +0000, Wei Yongjun wrote:
> Fixes the following sparse warning:
> 
> drivers/ata/ahci_mvebu.c:85:5: warning:
>  symbol 'ahci_mvebu_stop_engine' was not declared. Should it be static?
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied to libata/for-4.18-fixes.

Thanks.

-- 
tejun
