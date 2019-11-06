From: Yabin Cui <yabinc@google.com>
Date: Wed, 06 Nov 2019 18:47:36 +0000
Subject: Re: [PATCH -next] coresight: funnel: Fix missing spin_lock_init()
Message-Id: <20191106184736.197733-1-yabinc@google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191106120021.115200-1-weiyongjun1@huawei.com>
In-Reply-To: <20191106120021.115200-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Yabin Cui <yabinc@google.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Thanks for the fix! I should have tested with CONFIG_DEBUG_SPINLOCK.

Tested-by: Yabin Cui <yabinc@google.com>
