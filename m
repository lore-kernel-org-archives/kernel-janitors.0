From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 17 Feb 2019 12:20:51 +0000
Subject: Re: [v6] coccinelle: semantic code search for missing put_device()
Message-Id: <10836645-5b19-a748-56d7-c0572a76ab4d@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <HK0PR02MB36344E2B29CEB195892F6420B2610@HK0PR02MB3634.apcprd02.prod.outlook.com>
 <8e7ba7c0-b7fe-a1f0-d28b-0c716ecbcfdb@web.de>
 <alpine.DEB.2.21.1902171235570.2444@hadrien>
 <1c152067-0135-79d7-1285-4bb9925054c8@web.de>
 <alpine.DEB.2.21.1902171246560.2444@hadrien>
 <782fd1c3-80ff-a296-b3a2-351257bb13b3@web.de>
 <alpine.DEB.2.21.1902171304520.2444@hadrien>
In-Reply-To: <alpine.DEB.2.21.1902171304520.2444@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Julia Lawall <julia.lawall@lip6.fr>, Wen Yang <yellowriver2010@hotmail.com>
Cc: Michal Marek <michal.lkml@markovi.net>, kernel-janitors@vger.kernel.org, Nicolas Palix <nicolas.palix@imag.fr>, LKML <linux-kernel@vger.kernel.org>, Coccinelle <cocci@systeme.lip6.fr>, Cheng Shengyu <cheng.shengyu@zte.com.cn>, Wen Yang <wen.yang99@zte.com.cn>

>> If you would insist on the specification of such an assignment exclusion
>> for a SmPL ellipsis:
>> Can we agree on a correct order?
>
> I don't get your point.

I propose to take another closer look at a bit of SmPL code.


> There is no correct order.

I have got an other software development view here.


> Each order expresses something different.

I agree to this information.


> The order that is currently in the semantic patch is the one
> that is more likely in practice.

Please check once more.

…
+@search exists@
+local idexpression id;
+expression x,e,e1;
+position p1,p2;
…
+@@
+
+id = of_find_device_by_node@p1(x)
+... when != e = id
…

Or:

…
+ ... when != id = e
…


Which SmPL specification will achieve the desired software behaviour?

Regards,
Markus
