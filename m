From: walter harms <wharms@bfs.de>
Date: Wed, 20 May 2009 12:18:07 +0000
Subject: Re: Are the cast necessary in function "kfree"?
Message-Id: <4A13F4FF.5090501@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5c43c2d40905200330p5b14be2ey567bc493374e09b3@mail.gmail.com>
In-Reply-To: <5c43c2d40905200330p5b14be2ey567bc493374e09b3@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Paul Mundt schrieb:
> On Wed, May 20, 2009 at 11:30:21AM +0100, Andr? Lopes wrote:
>> Hi. This is my first post :-)
>>
>> I was reading this doc (/linux-2.6/Documentation/scsi/ChangeLog.lpfc),
>> when I found this phrase: "Replace some kfree((void*)ptr) with
>> kfree(ptr)."
>>
> [snip]
> 
>> These casts are not necessary...I think so. If it's yes, can we apply
>> patch's to clean-up this?
>>
> The key thing here is "ptr", as long as these are pointers, then the cast
> is superfluous. In the case of casting from a non-pointer type, the cast
> is necessary, particularly if the data type and pointer size vary.

i think the problem is clear,

since he ask for advice..
IMHO i would start with identifying adding a marker
like /* cast needed ...*/, perhaps creating a  myfree(propper type).

that would document the use and prevent other people from converting.

just my 2 cents,
re,
 wh



