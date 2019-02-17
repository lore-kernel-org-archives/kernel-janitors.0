From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 17 Feb 2019 13:14:38 +0000
Subject: Re: [v6] coccinelle: semantic code search for missing put_device()
Message-Id: <52c07e7c-eec7-792b-0b03-b5cb46ddeab3@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <HK0PR02MB36344E2B29CEB195892F6420B2610@HK0PR02MB3634.apcprd02.prod.outlook.com>
 <8e7ba7c0-b7fe-a1f0-d28b-0c716ecbcfdb@web.de>
 <alpine.DEB.2.21.1902171235570.2444@hadrien>
 <1c152067-0135-79d7-1285-4bb9925054c8@web.de>
 <alpine.DEB.2.21.1902171246560.2444@hadrien>
 <782fd1c3-80ff-a296-b3a2-351257bb13b3@web.de>
 <alpine.DEB.2.21.1902171304520.2444@hadrien>
 <10836645-5b19-a748-56d7-c0572a76ab4d@web.de>
 <alpine.DEB.2.21.1902171350500.2444@hadrien>
In-Reply-To: <alpine.DEB.2.21.1902171350500.2444@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Julia Lawall <julia.lawall@lip6.fr>, Wen Yang <yellowriver2010@hotmail.com>
Cc: Michal Marek <michal.lkml@markovi.net>, kernel-janitors@vger.kernel.org, Nicolas Palix <nicolas.palix@imag.fr>, LKML <linux-kernel@vger.kernel.org>, Coccinelle <cocci@systeme.lip6.fr>, Cheng Shengyu <cheng.shengyu@zte.com.cn>, Wen Yang <wen.yang99@zte.com.cn>

>> …
>> +@search exists@
>> +local idexpression id;
>> +expression x,e,e1;
>> +position p1,p2;
>> …
>> +@@
>> +
>> +id = of_find_device_by_node@p1(x)
>> +... when != e = id
>> …
>>
>> Or:
>>
>> …
>> + ... when != id = e
>> …
>>
>>
>> Which SmPL specification will achieve the desired software behaviour?
>
> The desired behavior is to check whether the allocated value is saved in
> some other variable (typically a structure field) and thus it doesn't need
> to be freed just because the original local variable goes out of scope at
> the end of the function.

I find this description reasonable to some degree.

(I am unsure if a programmer would like to fiddle with return value storage
in a data structure member from a local variable.)


> when != e = id achieves this behavior.

I can not agree to this view completely because of the meaning that is connected
with these variable identifiers.

Both metavariables share the kind “expression”. So I can imagine
that there is an intersection for the source code match possibility.
But one was intentionally restricted to the kind “local idexpression” so far.

Which data element should not get reassigned here (before a corresponding
null pointer check)?

Regards,
Markus
