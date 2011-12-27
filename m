From: Julia Lawall <julia.lawall@lip6.fr>
Date: Tue, 27 Dec 2011 14:46:10 +0000
Subject: Re: [PATCH 6/6] drivers/mtd/nand/txx9ndfmc.c: use
Message-Id: <alpine.DEB.2.02.1112271545480.1838@localhost6.localdomain6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1324994491-21828-1-git-send-email-julia@diku.dk>
 <1324994491-21828-7-git-send-email-julia@diku.dk>
 <1324997145.1165.88.camel@sauron.fi.intel.com>
In-Reply-To: <1324997145.1165.88.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Artem Bityutskiy <dedekind1@gmail.com>
Cc: kernel-janitors@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org

On Tue, 27 Dec 2011, Artem Bityutskiy wrote:

> On Tue, 2011-12-27 at 15:01 +0100, Julia Lawall wrote:
>> From: Julia Lawall <julia@diku.dk>
>>
>> Reimplement a call to devm_request_mem_region followed by a call to ioremap
>> or ioremap_nocache by a call to devm_request_and_ioremap.
>>
>> The semantic patch that makes this transformation is as follows:
>> (http://coccinelle.lip6.fr/)
>>
>> // <smpl>
>> @nm@
>> expression myname;
>> identifier i;
>> @@
>>
>> struct platform_driver i = { .driver = { .name = myname } };
>>
>> @@
>> expression dev,res,size;
>> expression nm.myname;
>> @@
>>
>> -if (!devm_request_mem_region(dev, res->start, size,
>> -                              \(res->name\|dev_name(dev)\|myname\))) {
>> -   ...
>> -   return ...;
>> -}
>> ... when != res->start
>> (
>> -devm_ioremap(dev,res->start,size)
>> +devm_request_and_ioremap(dev,res)
>> |
>> -devm_ioremap_nocache(dev,res->start,size)
>> +devm_request_and_ioremap(dev,res)
>> )
>> ... when any
>>     when != res->start
>> // </smpl>
>>
>> Signed-off-by: Julia Lawall <julia@diku.dk>
>
> Pushed to l2-mtd-2.6.git, thanks!
>
> I think this semantic patch is also useful and deserves to be added to
> scripts/coccinelle. In general, it would be great if you sumbitted
> useful spatches there for inclusion.

OK, I will add this one as well.

julia
