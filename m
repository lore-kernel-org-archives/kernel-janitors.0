From: Yash Shah <yash.shah@sifive.com>
Date: Wed, 04 Sep 2019 12:22:22 +0000
Subject: Re: [PATCH -next] pwm: sifive: Remove redundant dev_err call in pwm_sifive_probe()
Message-Id: <CAJ2_jOHMu3V=wv7mThSw0A6wMkE1N_=sN3_8PjEOw+cLPO94NA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190904111836.122616-1-weiyongjun1@huawei.com>
In-Reply-To: <20190904111836.122616-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: linux-pwm@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>, kernel-janitors@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org

On Wed, Sep 4, 2019 at 4:31 PM Wei Yongjun <weiyongjun1@huawei.com> wrote:
>
> There is a error message within devm_ioremap_resource
> already, so remove the dev_err call to avoid redundant
> error message.
>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/pwm/pwm-sifive.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>

Reviewed-by: Yash Shah <yash.shah@sifive.com>
