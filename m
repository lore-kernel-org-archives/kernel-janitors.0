From: Dongjiu Geng <gengdongjiu@huawei.com>
Date: Mon, 09 Nov 2020 09:51:20 +0000
Subject: Re: [PATCH] clk: hisilicon: Fix the memory leak issues
Message-Id: <b6aedf2a-ed8a-938d-7962-34fd5c314f55@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201106203525.9991-1-gengdongjiu@huawei.com>
 <30b24944-1315-b6de-5290-28b9d7842610@web.de>
In-Reply-To: <30b24944-1315-b6de-5290-28b9d7842610@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>, linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>

On 2020/11/8 21:55, Markus Elfring wrote:
>> When return errors, …
> 
> I would find an other wording more appropriate for this change description.
> 
> 
>> …, so fix this issue.
> 
> I suggest to replace this information by an other imperative wording
> and the tag “Fixes”.

OK, done， I have submitted the version 2 patch

> 
> 
> …
>> +++ b/drivers/clk/hisilicon/clk-hi3620.c
>> @@ -463,12 +463,16 @@ static void __init hi3620_mmc_clk_init(struct device_node *node)
>>  	}
>>
>>  	clk_data = kzalloc(sizeof(*clk_data), GFP_KERNEL);
>> -	if (WARN_ON(!clk_data))
>> +	if (WARN_ON(!clk_data)) {
>> +		iounmap(base);
> 
> Can a statement like “goto unmap_io;” make sense here?
OK， I have changed it.

> 
> 
>>  		return;
>> +	}
>>
>>  	clk_data->clks = kcalloc(num, sizeof(*clk_data->clks), GFP_KERNEL);
>> -	if (!clk_data->clks)
>> +	if (!clk_data->clks) {
> 
> How do you think about to add the function call “kfree(clk_data)” in this if branch?
OK, I have changed it.

> 
> 
> …
>> +++ b/drivers/clk/hisilicon/clk.c
> …
>  	if (!base) {
>  		pr_err("%s: failed to map clock registers\n", __func__);
> -		goto err;
> +		return NULL;
> 
> 
>> @@ -69,8 +69,10 @@ struct hisi_clock_data *hisi_clk_init(struct device_node *np,
>>  	}
>>
>>  	clk_data = kzalloc(sizeof(*clk_data), GFP_KERNEL);
>> -	if (!clk_data)
>> +	if (!clk_data) {
>> +		iounmap(base);
>>  		goto err;
> 
> Please use another jump target.
OK, thanks, I have changed it.

> 
> 
>> @@ -82,6 +84,7 @@ struct hisi_clock_data *hisi_clk_init(struct device_node *np,
>>  	of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data->clk_data);
>>  	return clk_data;
>>  err_data:
>> +	iounmap(base);
>>  	kfree(clk_data);
>>  err:
>>  	return NULL;
> 
> I propose to apply the following code variant.
OK, have modified.

> 
> 	return clk_data;
> 
> free_clk_data:
> 	kfree(clk_data);
> unmap_io:
> 	iounmap(base);
> 	return NULL;
> 
> 
> Regards,
> Markus
> .
> 
