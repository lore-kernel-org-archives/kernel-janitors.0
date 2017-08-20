From: Marion & Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 20 Aug 2017 21:23:43 +0000
Subject: Re: [PATCH 2/2] soc/fsl/qe: Slighly simplify code
Message-Id: <8e0fba46-d969-a53d-12d1-3f2ae85a8464@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170820155328.882-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170820155328.882-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org



Le 20/08/2017 à 21:11, walter harms a écrit :
>
> Am 20.08.2017 17:53, schrieb Christophe JAILLET:
>> Return 0 instead of 'ret' (which is 0 at this point) to make the code more
>> explicit.
>> Also avoid a useless initialization of 'ret'.
>>
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>>   drivers/soc/fsl/qe/qe_tdm.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/soc/fsl/qe/qe_tdm.c b/drivers/soc/fsl/qe/qe_tdm.c
>> index 6b9647fee512..c90c72ca9e3e 100644
>> --- a/drivers/soc/fsl/qe/qe_tdm.c
>> +++ b/drivers/soc/fsl/qe/qe_tdm.c
>> @@ -42,7 +42,7 @@ int ucc_of_parse_tdm(struct device_node *np, struct ucc_tdm *utdm,
>>   		     struct ucc_tdm_info *ut_info)
>>   {
>>   	const char *sprop;
>> -	int ret = 0;
>> +	int ret;
>>   	u32 val;
>>   	struct resource *res;
>>   	struct device_node *np2;
>> @@ -171,7 +171,7 @@ int ucc_of_parse_tdm(struct device_node *np, struct ucc_tdm *utdm,
>>   		siram_init_flag = 1;
>>   	}
>>   
>> -	return ret;
>> +	return 0;
>>   
>>   err_miss_siram_property:
>>   	return ret;
> This lonely return ret looks like a left over from some cleanup opperation.
> Is there any reason why to use goto instead of a plain return ?
>
> re,
>   wh
>
I don't see any.

If agreed that the patch 1/2 which remove a devm_ function in the error 
handling path is correct, additional clean-ups could be performed as well.
    - direct return instead of branching to the err_miss_siram_property 
label
    - removing the err_miss_siram_property label
    - turning the:
         ret = -EINVAL;
         pr_err(<somtehing>);
         return ret;
      statements into:
         pr_err(<somtehing>);
         return -EINVAL;

Will propose it when/if 1/2 is confirmed.

Christophe
