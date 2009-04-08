From: Jack Stone <jwjstone@fastmail.fm>
Date: Wed, 08 Apr 2009 14:46:29 +0000
Subject: Re: [PATCH 54/56] x86: Remove void casts
Message-Id: <49DCB8C5.4090108@fastmail.fm>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1239189748-11703-50-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-51-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-52-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-53-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-54-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-55-git-send-email-jwjstone@fastmail.fm> <36ca99e90904080518qf81b483h6ed2bc9752ee0d1e@mail.gmail.com> <49DCAE97.8040602@fastmail.fm> <20090408140637.GC12931@elte.hu> <49DCB140.7000603@fastmail.fm> <20090408144055.GH12931@elte.hu>
In-Reply-To: <20090408144055.GH12931@elte.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@elte.hu>
Cc: Bert Wesarg <bert.wesarg@googlemail.com>, linux-kernel@vger.kernel.org, jeff@garzik.org, kernel-janitors@vger.kernel.org

Ingo Molnar wrote:
> * Jack Stone <jwjstone@fastmail.fm> wrote:
>
>   
>> Ingo Molnar wrote:
>>     
>>> * Jack Stone <jwjstone@fastmail.fm> wrote:
>>>
>>>   
>>>       
>>>> Fixed patch
>>>>
>>>> Thanks,
>>>>     
>>>>         
>>> Hm, what was fixed?
>>>   
>>>       
>> I removed casts on pointer arithmetic which probably still needed to be
>> there to do the arithmetic properly.
>>     
>
> ... which pretty much proves the point that these patches should not 
> go via any "trivial" tree.
>
> Those additions of mmu pointers you did were outright lethal, i 
> doubt this stuff could have booted on both 32-bit and 64-bit x86.
>
> Please dont do this. Or if you do, please double check your change 
> and double check that the relevant vmlinux disassembly is still bit 
> for bit the same.
>   

Thats what I meant by fixed - those changes were removed from the patch.

Thanks,

Jack
