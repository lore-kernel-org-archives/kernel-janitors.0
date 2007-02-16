From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Fri, 16 Feb 2007 09:46:23 +0000
Subject: Re: [KJ] [PATCH 1/5] moving to is_power_of_2
Message-Id: <45D57D6F.6030403@student.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1171605222.27506.74.camel@wriver-t81fb058.linuxcoe>
In-Reply-To: <1171605222.27506.74.camel@wriver-t81fb058.linuxcoe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Vignesh Babu BM wrote:
> On Fri, 2007-02-16 at 08:47 +0100, Richard Knutsson wrote:
>   
>> Vignesh Babu BM wrote:
>>     
>>>  
>>>  	size = memparse(str, &str);
>>> -	if (*str || (size & (size-1)) || !(tr_pages & size) ||
>>> +	//if (*str || (size & (size-1)) || !(tr_pages & size) ||
>>> +	if (*str || !is_power_of_2(size) || !(tr_pages & size) ||
>>>  		size <= PAGE_SIZE ||
>>>  		size >= (1UL << PAGE_SHIFT << MAX_ORDER)) {
>>>  		printk(KERN_WARNING "Invalid huge page size specified\n");  
>>>       
>> I don't think this line is correct by the reason said above and what is 
>> the deal with the _C++_ commentary?
>> One of the "golden rules" with patches is: it should only doing one 
>> thing and do it right. You are only doing one thing but why comment out 
>> the line that you later delete? If I understand it correctly, you 
>> patch-serie of 5 only need to be 2. (Makes it simpler to add/remove).
>>     
> Working on the cleanup...just a quick clarification....
> size <= PAGE_SIZE will result in true when size=0
> is that not the same that happens when we run !is_power_of_2(size) when
> size=0?
>
>   
Yes, the result (I think) will be the same, but (size & (size-1)) is 0 
when size = 0, while !is_power_of_2(0) is true (1). So can you say (size 
& (size-1)) was intended as !is_power_of_2?

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
