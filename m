From: Colin Ian King <colin.king@canonical.com>
Date: Wed, 13 Sep 2017 10:05:39 +0000
Subject: Re: DR Checker and KINT static checkers
Message-Id: <d17e2cb4-ccd5-9bdb-89d7-5a2b2933d11c@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170913095202.a6zsi3xeryzhmxrl@mwanda>
In-Reply-To: <20170913095202.a6zsi3xeryzhmxrl@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 13/09/17 11:04, Julia Lawall wrote:
> 
> 
> On Wed, 13 Sep 2017, Colin Ian King wrote:
> 
>> On 13/09/17 10:52, Dan Carpenter wrote:
>>> LWN.net recently had an article about Dr Checker.  It's a promising new
>>> static analysis tool.  The LWN article is for subscribers only until
>>> tomorrow, but anyone can read the PDF or install the code.  It would be
>>> really interesting if someone could run Dr Checker on a mainline kernel
>>> tree and post the results.
>>> https://lwn.net/Articles/733056/
>>> https://www.usenix.org/system/files/conference/usenixsecurity17/sec17-machiry.pdf
>>> https://github.com/ucsb-seclab/dr_checker/
>>>
>>> The other tool that's quite interesting is KINT which looks for integer
>>> overflows.  It's a bit of a pain because you have to annotate some
>>> kernel functions to make it work.  The PDF and source code are here:
>>>
>>> http://css.csail.mit.edu/kint/
>>>
>>> regards,
>>> dan carpenter
>>>
>>
>> Funnily enough, I tried Dr Checker out earlier this week.  One has to
>> make it do a fake build of the kernel to gather information on how to
>> build the specific kernel config (e.g. how it was compiled and the gcc
>> build flags) and then this gets parsed by DR-Checker.  Unfortunately it
>> seems that it only supported arm architecture builds and it could not
>> handle the gcc output for a modern x86 amd64 gcc (gcc 7.2). I kind of
>> gave up after a couple of hours trying to make it work.  I suspect more
>> patient developers may figure out how to make it work. I may go back and
>> revisit this when I have some free time.
> 
> You could ask the authors.  They may be happy to have some feedback.
> 
> julia

Yep, I'll do that sometime this week when I get some free cycles. :-)

Colin

> 
>>
>> Colin
>> --
>> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

