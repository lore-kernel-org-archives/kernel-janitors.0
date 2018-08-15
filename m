From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 15 Aug 2018 09:54:26 +0000
Subject: Re: [PATCH -next] platform/x86: mlx-platform: Fix copy-paste error in mlxplat_init()
Message-Id: <CAHp75VffejtfTRNe7O7q0b1nj-4qXPK-t_-WYFq5YB9axh=Okg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1533700830-137279-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1533700830-137279-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Aug 8, 2018 at 6:56 AM, Vadim Pasternak <vadimp@mellanox.com> wrote:
>
>
>> -----Original Message-----
>> From: Wei Yongjun <weiyongjun1@huawei.com>
>> Sent: Wednesday, August 08, 2018 7:01 AM
>> To: Vadim Pasternak <vadimp@mellanox.com>; Darren Hart
>> <dvhart@infradead.org>; Andy Shevchenko <andy@infradead.org>
>> Cc: Wei Yongjun <weiyongjun1@huawei.com>; platform-driver-
>> x86@vger.kernel.org; kernel-janitors@vger.kernel.org
>> Subject: [PATCH -next] platform/x86: mlx-platform: Fix copy-paste error in
>> mlxplat_init()
>>
>> The return value from platform_device_register_resndata() is not checked
>> correctly. The test is done against a wrong variable. This patch fix it.
>>
>> Fixes: 0378123c5800 ("platform/x86: mlx-platform: Add mlxreg-fan platform
>> driver activation")
>> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
>

Pushed to my review and testing queue, thanks!

> Acked-by: Vadim Pasternak <vadimp@mellanox.com>
>
>> ---
>>  drivers/platform/x86/mlx-platform.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-
>> platform.c
>> index e1f9fce..d89936c 100644
>> --- a/drivers/platform/x86/mlx-platform.c
>> +++ b/drivers/platform/x86/mlx-platform.c
>> @@ -1704,8 +1704,8 @@ static int __init mlxplat_init(void)
>>                                       PLATFORM_DEVID_NONE, NULL, 0,
>>                                       mlxplat_fan,
>>                                       sizeof(*mlxplat_fan));
>> -             if (IS_ERR(priv->pdev_io_regs)) {
>> -                     err = PTR_ERR(priv->pdev_io_regs);
>> +             if (IS_ERR(priv->pdev_fan)) {
>> +                     err = PTR_ERR(priv->pdev_fan);
>>                       goto fail_platform_io_regs_register;
>>               }
>>       }
>



-- 
With Best Regards,
Andy Shevchenko
