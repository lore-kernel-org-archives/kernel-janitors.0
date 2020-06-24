From: Tiezhu Yang <yangtiezhu@loongson.cn>
Date: Wed, 24 Jun 2020 12:07:55 +0000
Subject: Re: [PATCH v3 03/14] irqchip/csky-mpintc: Fix potential resource leaks
Message-Id: <be3acb13-2963-ddf1-a867-7e30fd23a0b4@loongson.cn>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a0ace7a8-5c26-ee20-fe76-7dff57a18ca3@web.de>
In-Reply-To: <a0ace7a8-5c26-ee20-fe76-7dff57a18ca3@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>, linux-mips@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Xuefeng Li <lixuefeng@loongson.cn>

On 06/24/2020 07:43 PM, Markus Elfring wrote:
>> There exists potential resource leaks in the error path, fix them.
> I suggest to improve this change description.
> How do you think about another wording variant?
>
>     Specific system resources were not released in a few error cases.
>     Thus add jump targets for the completion of the desired exception handling.

OK, thank you, it looks good to me.
Maybe I can use this description for other patches of this series.

>
>
> …
> +++ b/drivers/irqchip/irq-csky-mpintc.c
> @@ -247,8 +247,10 @@ csky_mpintc_init(struct device_node *node, struct device_node *parent)
> …
>   		INTCG_base = ioremap(mfcr("cr<31, 14>"),
>   				     INTCL_SIZE*nr_cpu_ids + INTCG_SIZE);
>
> See also:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?id>08a95294a4fb3702bb3d35ed08028433c37fe6#n257
>
>
> …
> +		if (INTCG_base = NULL) {
>
>
> Would you like to use the following code variant?
>
> See also:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/checkpatch.pl?id>08a95294a4fb3702bb3d35ed08028433c37fe6#n5756
>
> +		if (!INTCG_base) {
>
>
> …
>> @@ -270,12 +274,22 @@ csky_mpintc_init(struct device_node *node, struct device_node *parent)
>>
>>   #ifdef CONFIG_SMP
>>   	ipi_irq = irq_create_mapping(root_domain, IPI_IRQ);
> …
>> +	if (!ipi_irq) {
>> +		ret = -EIO;
>> +		goto err_domain_remove;
>> +	}
> …
>
> Can the function call “irq_domain_remove(root_domain)” become relevant
> only if the preprocessor symbol “CONFIG_SMP” was defined?

OK, I will do it in the next version.

>
> Regards,
> Markus
