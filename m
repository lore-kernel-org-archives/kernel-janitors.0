From: Dongjiu Geng <gengdongjiu@huawei.com>
Date: Thu, 19 Nov 2020 12:01:22 +0000
Subject: Re: [PATCH v3] clk: hisilicon: refine hi3620_mmc_clk_init() and fix memory leak issues
Message-Id: <5b976ad4-43e2-a021-6a93-25642b44cec5@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201112192214.48926-1-gengdongjiu@huawei.com>
 <ef1eac81-c4f9-ca4d-f056-3cdbddcaad73@web.de>
In-Reply-To: <ef1eac81-c4f9-ca4d-f056-3cdbddcaad73@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>, linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Julia Lawall <julia.lawall@lip6.fr>

On 2020/11/19 17:07, Markus Elfring wrote:
>> Refine hi3620_mmc_clk_init() to use of_clk_add_hw_provider()
>> instead of of_clk_add_provider(), …
> 
> …
>> +++ b/drivers/clk/hisilicon/clk-hi3620.c
> …
>> @@ -439,17 +440,22 @@  static struct clk *hisi_register_clk_mmc(struct hisi_mmc_clock *mmc_clk,
> …
>> +	err = clk_hw_register(NULL, hw);
>> +
>> +	if (err) {
> 
> I suggest to omit a blank line here.
> 
> 
> …
>> +++ b/drivers/clk/hisilicon/clk.c
>> @@ -65,25 +65,26 @@  struct hisi_clock_data *hisi_clk_init(struct device_node *np,
> …
>>  	of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data->clk_data);
>>  	return clk_data;
>> -err_data:
>> +free_clk_data:
> 
> How do you think about to adjust also such a function call for this function implementation?
> 
> Will further collateral evolution become interesting?
> https://elixir.bootlin.com/linux/v5.10-rc4/C/ident/of_clk_add_provider
Thanks for the review.

How about we adjust such a function call in another series patches?  I suggest do it in another series.
For this patch, how about we firstly merge it after I fix the above comments(omit a blank line)?

> 
> Regards,
> Markus
> .
> 
