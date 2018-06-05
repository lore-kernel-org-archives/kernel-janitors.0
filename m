From: Jens Axboe <axboe@kernel.dk>
Date: Tue, 05 Jun 2018 15:19:19 +0000
Subject: Re: [PATCH -next] lightnvm: pblk: make symbol write_buffer_size static
Message-Id: <f961c389-20d6-328e-d263-38f4ec9460dc@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1528190112-15645-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1528190112-15645-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>, Matias Bjorling <mb@lightnvm.io>, Marcin Dziegielewski <marcin.dziegielewski@intel.com>
Cc: linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org

On 6/5/18 3:15 AM, Wei Yongjun wrote:
> Fixes the following sparse warning:
> 
> drivers/lightnvm/pblk-init.c:23:14: warning:
>  symbol 'write_buffer_size' was not declared. Should it be static?

Added, thanks.

-- 
Jens Axboe

