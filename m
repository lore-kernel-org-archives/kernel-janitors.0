From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Fri, 15 Sep 2017 08:48:48 +0000
Subject: Re: [PATCH] dma-buf: remove redundant initialization of sg_table
Message-Id: <150546532831.19729.6169136066415731528@mail.alporthouse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170914230516.6056-1-colin.king@canonical.com>
In-Reply-To: <20170914230516.6056-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Quoting Colin King (2017-09-15 00:05:16)
> From: Colin Ian King <colin.king@canonical.com>
> 
> sg_table is being initialized and is never read before it is updated
> again later on, hence making the initialization redundant. Remove
> the initialization.
> 
> Detected by clang scan-build:
> "warning: Value stored to 'sg_table' during its initialization is
> never read"
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
