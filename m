From: Tiezhu Yang <yangtiezhu@loongson.cn>
Date: Wed, 01 Jul 2020 09:35:35 +0000
Subject: Re: [PATCH v4 02/14] irqchip/csky-apb-intc: Fix potential resource leaks
Message-Id: <1a0e007a-db94-501b-4ab9-0bb479ec093b@loongson.cn>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1593569786-11500-1-git-send-email-yangtiezhu@loongson.cn>
 <1593569786-11500-3-git-send-email-yangtiezhu@loongson.cn>
 <564ffff9-6043-7191-2458-f425dd8d0c11@web.de>
In-Reply-To: <564ffff9-6043-7191-2458-f425dd8d0c11@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 07/01/2020 04:40 PM, Markus Elfring wrote:
>> … were not released in a few error cases. …
> Another small wording adjustment:
>    … in two error cases. …

OK

>
>
> …
>> +++ b/drivers/irqchip/irq-csky-apb-intc.c
> …
>> @@ -126,10 +127,17 @@ ck_intc_init_comm(struct device_node *node, struct device_node *parent)
> …
>> +err_iounmap:
>> +	iounmap(reg_base);
>> +	return ret;
>>   }
> …
>
> How do you think about to use the statement “return -ENOMEM;”?

OK

> Can the local variable “ret” be omitted in this function implementation?

If remove the local variable "ret",  it will look like this:

diff --git a/drivers/irqchip/irq-csky-apb-intc.c 
b/drivers/irqchip/irq-csky-apb-intc.c
index 5a2ec43..7e56657 100644
--- a/drivers/irqchip/irq-csky-apb-intc.c
+++ b/drivers/irqchip/irq-csky-apb-intc.c
@@ -101,8 +101,6 @@ static inline void setup_irq_channel(u32 magic, void 
__iomem *reg_addr)
  static int __init
  ck_intc_init_comm(struct device_node *node, struct device_node *parent)
  {
-       int ret;
-
         if (parent) {
                 pr_err("C-SKY Intc not a root irq controller\n");
                 return -EINVAL;
@@ -118,18 +116,23 @@ ck_intc_init_comm(struct device_node *node, struct 
device_node *parent)
&irq_generic_chip_ops, NULL);
         if (!root_domain) {
                 pr_err("C-SKY Intc irq_domain_add failed.\n");
-               return -ENOMEM;
+               goto err_iounmap;
         }

-       ret = irq_alloc_domain_generic_chips(root_domain, 32, 1,
+       if (irq_alloc_domain_generic_chips(root_domain, 32, 1,
                         "csky_intc", handle_level_irq,
-                       IRQ_NOREQUEST | IRQ_NOPROBE | IRQ_NOAUTOEN, 0, 0);
-       if (ret) {
+                       IRQ_NOREQUEST | IRQ_NOPROBE | IRQ_NOAUTOEN, 0, 0)) {
                 pr_err("C-SKY Intc irq_alloc_gc failed.\n");
-               return -ENOMEM;
+               goto err_domain_remove;
         }

         return 0;
+
+err_domain_remove:
+       irq_domain_remove(root_domain);
+err_iounmap:
+       iounmap(reg_base);
+       return -ENOMEM;
  }

>
> Regards,
> Markus
