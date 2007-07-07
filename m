From: yoann padioleau <padator@wanadoo.fr>
Date: Sat, 07 Jul 2007 13:36:24 +0000
Subject: [KJ] Re: [PATCH] some kmalloc/memset ->kzalloc (tree wide)
Message-Id: <0BE121C2-D115-4A9A-A557-E65F0F8CBA26@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <878x9ta320.fsf@wanadoo.fr> <468F901B.2000000@imap.cc>
In-Reply-To: <468F901B.2000000@imap.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tilman Schmidt <tilman@imap.cc>
Cc: kernel-janitors@lists.osdl.org, akpm@linux-foundation.org, linux-kernel@vger.kernel.org, Julia Lawall <julia@diku.dk>


On 7 juil. 07, at 15:07, Tilman Schmidt wrote:

> Am 06.07.2007 18:51 schrieb Yoann Padioleau:
>> @@
>> expression E1,E2,E3;
>> @@
>>
>> - kzalloc(E1 * E2,E3)
>> + kcalloc(E1,E2,E3)
>
> This misses the semantic distinction between the first and second
> arguments of kcalloc(). The first argument is supposed to be the
> number of elements to allocate and the second their size. As a
> consequence, the following hunks in your pathc are wrong:

Yes you are right. Andrew Morton fixed the problem in a
subsequent patch.

I should have written a more precise semantic patch such as

@@
expression E;
constant c;
type T;
@@

- kzalloc(sizeof(T) * c, E)
+ kcalloc(c, sizeof(T), E)


Note that sometimes the code is written as  kzalloc(c * sizeof(T), E)
as in   kzalloc(2 * sizeof(struct resource), GFP_KERNEL)  but
our transformation engine can handle the commutativity of '*' and still
performs the right transformation.


>
>> diff --git a/arch/arm/mach-iop13xx/pci.c b/arch/arm/mach-iop13xx/ 
>> pci.c
>> index 9d63d7f..b84955f 100644
>> --- a/arch/arm/mach-iop13xx/pci.c
>> +++ b/arch/arm/mach-iop13xx/pci.c
>> @@ -1002,11 +1002,10 @@ int iop13xx_pci_setup(int nr, struct pci
>>  	if (nr > 1)
>>  		return 0;
>>
>> -	res = kmalloc(sizeof(struct resource) * 2, GFP_KERNEL);
>> +	res = kcalloc(sizeof(struct resource), 2, GFP_KERNEL);
>>  	if (!res)
>>  		panic("PCI: unable to alloc resources");
>>
>> -	memset(res, 0, sizeof(struct resource) * 2);
>>
>>  	/* 'nr' assumptions:
>>  	 * ATUX is always 0
>


_______________________________________________
REMINDER: this mailing list moved to vger.kernel.org and current one will be discontinued soon.
To resubscribe, send email to majordomo@vger.kernel.org with
&quot;subscribe kernel-janitors&quot; in message body and follow instructions.

Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
