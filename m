From: walter harms <wharms@bfs.de>
Date: Wed, 26 Oct 2016 12:14:42 +0000
Subject: Re: [PATCH 3/3] clk: keystone: Fix missing iounmap calls in an error handling path
Message-Id: <58109E32.7080606@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <7ed7c1abf1666f1e6eda240bb705940bc14bd186.1477339880.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <7ed7c1abf1666f1e6eda240bb705940bc14bd186.1477339880.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Am 25.10.2016 22:35, schrieb Stephen Boyd:
> On 10/25, walter harms wrote:
>> Am 24.10.2016 22:43, schrieb Christophe JAILLET:
>>> @@ -220,6 +218,12 @@ static void __init _of_pll_clk_init(struct device_node *node, bool pllctrl)
>>>  
>>>  out:
>>>  	pr_err("%s: error initializing pll %s\n", __func__, node->name);
>>> +	if (pll_data->pllm)
>>> +		iounmap(pll_data->pllm);
>>> +	if (pll_data->pll_ctl0)
>>> +		iounmap(pll_data->pll_ctl0);
>>> +	if (pll_data->pllod)
>>> +		iounmap(pll_data->pllod);
>>>  	kfree(pll_data);
>>>  }
>>>  
>>
>> IMHO calles the iounmap() need no check for NULL.
>>
> 
> ARM doesn't seem to check for NULL there though. So that would be
> a bug.
> 
> It would be nice to remove the checks though. Perhaps someone
> could do that by unifying ionumap into asm-generic with the NULL
> check and then have architecture specific functions for the rest
> of it?
> 

Is there a specific reason not to check ?
It seems not wise to have different behavior across architectures.

re,
 wh
