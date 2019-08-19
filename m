From: Rob Herring <robh@kernel.org>
Date: Mon, 19 Aug 2019 16:56:53 +0000
Subject: Re: [PATCH -next] drm/panfrost: Fix missing unlock on error in panfrost_mmu_map_fault_addr()
Message-Id: <CAL_JsqJA5kZo5_uJPJdgdPyLL5FwBDjcV9EWzPotef2=LrSNHQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190814044814.102294-1-weiyongjun1@huawei.com>
In-Reply-To: <20190814044814.102294-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>

On Tue, Aug 13, 2019 at 11:44 PM Wei Yongjun <weiyongjun1@huawei.com> wrote:
>
> Add the missing unlock before return from function panfrost_mmu_map_fault_addr()
> in the error handling case.
>
> Fixes: 187d2929206e ("drm/panfrost: Add support for GPU heap allocations")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_mmu.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Applied, thanks.

Rob
