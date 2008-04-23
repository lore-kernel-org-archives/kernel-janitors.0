From: Roel Kluin <12o3l@tiscali.nl>
Date: Wed, 23 Apr 2008 14:05:30 +0000
Subject: Re: script to find incorrect tests on unsigneds
Message-Id: <480F422A.1050503@tiscali.nl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4808C90A.5040600@tiscali.nl>
In-Reply-To: <4808C90A.5040600@tiscali.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Julia Lawall wrote:

>> and besides your evaluated the tests:
>>
>> * i < [any negative value]
>> * i >= [0 or any negative value]
>> * i = [any negative value]
>> * i != [any negative value]
>> * [0 or any negative value] <= i
>> * [0 or any negative value] > i
> 
> We do 0 > i via the isomoprhisms.  But I have never seen such code.
> 
> As you mention, we could consider more kinds of comparison to 0 by writing 
> more patterns, eg;
> 
> (
>  i < 0
> |
>  i <= 0
> |
>  i = -C
> |
>  i < -C
> |
>  i <= -C
> )
> 
> where C was previously declared to be any constant.

this should be different:

 (
* i < 0
|
* i = -C
|
* i < -C
|
* i >= -C
)
