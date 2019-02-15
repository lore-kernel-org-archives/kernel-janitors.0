From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 15 Feb 2019 07:11:18 +0000
Subject: Re: [v4] coccinelle: semantic patch for missing put_device()
Message-Id: <c7fc1e2e-306f-9c2f-e271-0c8de9128720@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <201902151422261425412@zte.com.cn>
 <alpine.DEB.2.21.1902150723110.2896@hadrien>
In-Reply-To: <alpine.DEB.2.21.1902150723110.2896@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>, Wen Yang <wen.yang99@zte.com.cn>
Cc: Yi Wang <wang.yi59@zte.com.cn>, kernel-janitors@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Wen Yang <yellowriver2010@hotmail.com>, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, Cheng Shengyu <cheng.shengyu@zte.com.cn>, cocci@systeme.lip6.fr

>>>> In a function, for variables returned by calling of_find_device_by_node(),
>>> Do variables really get returned?
>>> The provided pointer should usually be stored somewhere.
>>
>> Thank you very much, we will consider this situation and  submit a next version to fix it.
>
> I don't know what Markus is talking about here,

I find that my feedback contained details for two items.

1. I suggested another adjustment for a wording in the evolving
   commit description.

2. Should any more case distinctions be taken into account for the data
   storage of function return values so that the shown source code search
   approach can become safer?


> so I'm not sure that a change is needed.

I am curious if there is a need for further clarifications then.


>>>> + "ERROR: missing put_device;"
>>> Will change confidence considerations result in another fine-tuning for this message?
>>
>> Thank you, we will change "ERROR" to "WARNING".
>
> I think ERROR is fine.

I have got a different software development view for the possible
severity information.


> If it is a real positive than it is a real problem.

I can agree to this information.

You specified also a precondition.
How should be achieved that the source code analysis will not point
false positives out?


> Warning is for things that look ugly,

I am also curious on how views will evolve around such ugliness.


> but don't have any impact on the execution.

I find such a restriction questionable.


Would you like to share any more ideas for safe data flow analysis
(eventually also together with your software)?

Regards,
Markus
