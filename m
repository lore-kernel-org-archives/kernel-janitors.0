From: John Garry <john.garry@huawei.com>
Date: Tue, 15 Dec 2020 15:54:05 +0000
Subject: Re: [bug report] driver core: platform: Add devm_platform_get_irqs_affinity()
Message-Id: <dde25c4d-8aee-76a7-742e-4beda275ee97@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X9jCzrzqfyEHIi26@mwanda>
In-Reply-To: <X9jCzrzqfyEHIi26@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 15/12/2020 14:06, Dan Carpenter wrote:
> Hello John Garry,

+

> 
> The patch e15f2fa959f2: "driver core: platform: Add
> devm_platform_get_irqs_affinity()" from Dec 2, 2020, leads to the
> following static checker warning:
> 
> 	drivers/base/platform.c:370 devm_platform_get_irqs_affinity()
> 	warn: 'nvec' possible negative type promoted to high
> 
> drivers/base/platform.c
>     351  int devm_platform_get_irqs_affinity(struct platform_device *dev,
>     352                                      struct irq_affinity *affd,
>     353                                      unsigned int minvec,
>     354                                      unsigned int maxvec,
>     355                                      int **irqs)
>     356  {
>     357          struct irq_affinity_devres *ptr;
>     358          struct irq_affinity_desc *desc;
>     359          size_t size;
>     360          int i, ret, nvec;
>     361
>     362          if (!affd)
>     363                  return -EPERM;
>     364
>     365          if (maxvec < minvec)
>     366                  return -ERANGE;
>     367
>     368          nvec = platform_irq_count(dev);
>     369
>     370          if (nvec < minvec)
>                      ^^^^
> If "nvec" is -EPROBE_DEFER then "minvec" is an unsigned int so it gets
> type promoted to a very high positive so it's > minvec.

Today this is kinda safe as the only in-tree user calls 
platform_get_irq() and tests for -EPROBE_DEFER prior to the 
devm_platform_get_irqs_affinity() call.

But, indeed, I should test for -EPROBE_DEFER here. And I can remove that 
platform_get_irq() I mentioned, which existed for another reason.

Thanks,
John

> 
>     371                  return -ENOSPC;
>     372
>     373          nvec = irq_calc_affinity_vectors(minvec, nvec, affd);
>     374          if (nvec < minvec)
>     375                  return -ENOSPC;
>     376
>     377          if (nvec > maxvec)
>     378                  nvec = maxvec;
>     379
>     380          size = sizeof(*ptr) + sizeof(unsigned int) * nvec;
> 
> regards,
> dan carpenter
> .
> 
