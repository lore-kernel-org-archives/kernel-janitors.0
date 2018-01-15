From: Catalin Marinas <catalin.marinas@arm.com>
Date: Mon, 15 Jan 2018 18:17:24 +0000
Subject: Re: [PATCH -next] firmware: arm_sdei: Fix return value check in sdei_present_dt()
Message-Id: <20180115181724.dwgzareorag7ndxc@armageddon.cambridge.arm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1516012913-196560-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1516012913-196560-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Mon, Jan 15, 2018 at 10:41:53AM +0000, Wei Yongjun wrote:
> In case of error, the function of_platform_device_create() returns
> NULL pointer not ERR_PTR(). The IS_ERR() test in the return value
> check should be replaced with NULL test.
> 
> Fixes: 677a60bd2003 ("firmware: arm_sdei: Discover SDEI support via ACPI")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied. Thanks.

-- 
Catalin
