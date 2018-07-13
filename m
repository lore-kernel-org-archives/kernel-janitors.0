From: Ray Jui <ray.jui@broadcom.com>
Date: Fri, 13 Jul 2018 16:53:29 +0000
Subject: Re: [PATCH -next] pinctrl: nsp: fix potential NULL dereference in nsp_pinmux_probe()
Message-Id: <14329d52-72bb-3594-dec3-00ab0f7ccd40@broadcom.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1531312461-134547-1-git-send-email-weiyongjun1@huawei.com>
 <CACRpkdbwAJOaFay3x45gyf7rBpkPOAMbxW6FLQUvCekUKatLYA@mail.gmail.com>
In-Reply-To: <CACRpkdbwAJOaFay3x45gyf7rBpkPOAMbxW6FLQUvCekUKatLYA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

Hi Linus,

On 7/13/2018 12:46 AM, Linus Walleij wrote:
> On Wed, Jul 11, 2018 at 2:25 PM Wei Yongjun <weiyongjun1@huawei.com> wrote:
> 
>> platform_get_resource() may fail and return NULL, so we should
>> better check it's return value to avoid a NULL pointer dereference
>> a bit later in the code.
>>
>> This is detected by Coccinelle semantic patch.
>>
>> @@
>> expression pdev, res, n, t, e, e1, e2;
>> @@
>>
>> res = platform_get_resource(pdev, t, n);
>> + if (!res)
>> +   return -EINVAL;
>> ... when != res = NULL
>> e = devm_ioremap_nocache(e1, res->start, e2);
>>
>> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> 
> Patch applied with Ray's ACK.

Would be nice to add the following Fixes tag:

Fixes: cc4fa83f66e9 ("pinctrl: nsp: add pinmux driver support for 
Broadcom NSP SoC")

Thanks,

Ray

> 
> Yours,
> Linus Walleij
> 
