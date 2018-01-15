From: James Morse <james.morse@arm.com>
Date: Mon, 15 Jan 2018 10:38:06 +0000
Subject: Re: [PATCH -next] firmware: arm_sdei: Fix return value check in sdei_present_dt()
Message-Id: <5A5C848E.70304@arm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1516012913-196560-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1516012913-196560-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

Hi Wei,

On 15/01/18 10:41, Wei Yongjun wrote:
> In case of error, the function of_platform_device_create() returns
> NULL pointer not ERR_PTR(). The IS_ERR() test in the return value
> check should be replaced with NULL test.

Bother, so it does!

Thanks for catching this.
Acked-by: James Morse <james.morse@arm.com>


Thanks,

James

