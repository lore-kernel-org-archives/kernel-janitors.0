From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 17 Feb 2019 12:00:47 +0000
Subject: Re: [v6] coccinelle: semantic code search for missing put_device()
Message-Id: <782fd1c3-80ff-a296-b3a2-351257bb13b3@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <HK0PR02MB36344E2B29CEB195892F6420B2610@HK0PR02MB3634.apcprd02.prod.outlook.com>
 <8e7ba7c0-b7fe-a1f0-d28b-0c716ecbcfdb@web.de>
 <alpine.DEB.2.21.1902171235570.2444@hadrien>
 <1c152067-0135-79d7-1285-4bb9925054c8@web.de>
 <alpine.DEB.2.21.1902171246560.2444@hadrien>
In-Reply-To: <alpine.DEB.2.21.1902171246560.2444@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Wen Yang <yellowriver2010@hotmail.com>, Nicolas Palix <nicolas.palix@imag.fr>, LKML <linux-kernel@vger.kernel.org>, Coccinelle <cocci@systeme.lip6.fr>, Cheng Shengyu <cheng.shengyu@zte.com.cn>, Wen Yang <wen.yang99@zte.com.cn>

>> Would you dare to interpret my update suggestion (reordering of two identifiers)
>> as a required SmPL script correction?
>
> I didn't suggest to reorder anything.

This is obvious according to your acknowledgement for the sixth version
of this evolving SmPL script.


> Both are needed.

If you would insist on the specification of such an assignment exclusion
for a SmPL ellipsis:
Can we agree on a correct order?


> And, no I don't consider it to be a required suggestion.

Have we got a different view about an implementation detail at this place?


> In practice, reassigning such a variable is very unlikely.

This can be.

Regards,
Markus
