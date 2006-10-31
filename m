From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Tue, 31 Oct 2006 03:54:20 +0000
Subject: Re: [KJ] [PATCH] Changed all calls to pci_module_init to
Message-Id: <4546C8EC.4020508@student.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20061028201039.GB20208@zeno.unh.edu>
In-Reply-To: <20061028201039.GB20208@zeno.unh.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Ethan A Burns wrote:
>> The cleaning up of the drivers is needed, it is just the removal of 
>> pci_module_init() that needs to be left out (just to minimize the risk 
>> of people complaining it was removed ahead of time). And if you don't 
>> find anything more to do, I would appreciate any help to replace the 
>> #define FALSE/TRUE-mess we currently have in the tree with the newly (in 
>> linus-tree just before 2.6.19-rc1) added false/true (is defined in 
>> include/linux/stddef.h).
>>     
>
> I wouldn't mind doing that.  Just a simple find/replace of 'FALSE' with 'false'
> and 'TRUE' with 'true'?  
Both yes and no. Of course you can do a simple replace (like just using 
sed with "s/FALSE/false/") but I think it is a good idea to check the 
paths for the variables to see they are real booleans (only gets 'false' 
and 'true', also only used in logical operations) and also clean up 
things like "if (b = TRUE)". If you make such a patch, can you cc: me 
too, please?
>                          Even these simple (tedious) things are a good
> learning experience for me, if nothing else than to just get use to sending
> patches, etc.
>   
You got the diffstat right and there where no errors in the patch (no 
line-wrapping or etc. that I could see), so good work. :)

cu around
Richard Knutsson

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
