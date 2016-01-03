From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 03 Jan 2016 12:13:15 +0000
Subject: Re: net-libertas: Better exception handling in if_spi_host_to_card_worker()
Message-Id: <5689105B.50005@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <5686F0B2.5000000@users.sourceforge.net>
 <56870866.7020000@cogentembedded.com>
 <568785B3.5000905@users.sourceforge.net>
 <alpine.DEB.2.02.1601020914100.2063@localhost6.localdomain6>
 <5687939E.7010701@users.sourceforge.net> <5687A2C7.3000704@gmail.com>
 <5687B2BC.8090901@users.sourceforge.net> <5688EBAC.5000701@gmail.com>
In-Reply-To: <5688EBAC.5000701@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arend van Spriel <aspriel@gmail.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, Kalle Valo <kvalo@codeaurora.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>>> What the patch tries to do is avoid the extra 'if (err)'.
>>
>> Yes. - I propose to look at related consequences together with the usage
>> of a popular short jump label once more.
> 
> When I read a subject saying "Better exception handling" it sounds like
> a functional improvement. Your change does not change anything
> functionally and may or may not save a bit of execution time depending
> on how smart the compiler is.

Can it eventually matter to skip another condition check in three cases?


> What you change does is confuse people reading the code.

A few software developers might find this proposal unusual.


> So please explain why your update improves exception handling here.
> I don't see it.

How does this feedback fit to the mentioned check avoidance?


> The code is not making the driver more robust against failures

That's true for this update suggestion.


> in this function, which is what I think of reading "better exception handling".

Other implementation details are affected by the shown fine-tuning.

Regards,
Markus
