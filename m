From: Colin Ian King <colin.king@canonical.com>
Date: Thu, 09 May 2019 14:55:32 +0000
Subject: Re: [PATCH] EDAC, sb_edac: remove redundant update of tad_base
Message-Id: <ebe15617-fe6a-2668-f14e-146811147f14@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190508224201.27120-1-colin.king@canonical.com>
 <20190509141313.GA17053@zn.tnic>
 <55f8efee-a02c-1574-42fa-35e1d3df14f7@canonical.com>
 <20190509144113.GB17053@zn.tnic>
In-Reply-To: <20190509144113.GB17053@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Borislav Petkov <bp@alien8.de>
Cc: Tony Luck <tony.luck@intel.com>, Qiuxu Zhuo <qiuxu.zhuo@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, James Morse <james.morse@arm.com>, linux-edac@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 09/05/2019 15:41, Borislav Petkov wrote:
> On Thu, May 09, 2019 at 03:29:42PM +0100, Colin Ian King wrote:
>> These are the Coverity static analysis warning/error message
>> classifications.  Tagging them should be useful for several reasons:
>>
>> 1. We can classify the types of issues being fixed
>> 2. We can see how many issues are being found/fixed with the use of
>> static analysis tools like Coverity
> 
> Who's "We"?

Well, I'm assuming folk who are using Coverity and folk who like
tracking bug stats.

> 
>> 3. It provides some context on how these bugs were being found.
> 
> I figured as much but I have more questions:
> 
> * you say "tools like Coverity" but the name Coverity is in the tag.
> So another tool would want to add its own tag. Which begs the second
> question:
> 
> * has it ever been discussed and/or agreed upon all those "tools" tags?
> 
> Because we remove internal tags which have no bearing on the upstream
> kernel. When I see that tag, how can I find out what it means? Can I run
> coverity myself?

Synopsis provide CoverityScan which can be used for free. There are
several instances of projects on the scan website that are analyzing the
kernel, for example:

https://scan.coverity.com/projects/linux
https://scan.coverity.com/projects/linux-next-weekly-scan

> 
> Lemme dig another one:
> 
> Addresses-Coverity-ID: 744899 ("Missing break in switch")
> 
> Where do I look up that ID?

https://scan.coverity.com/projects/linux

> 
> And so on...
> 
> Bottom line of what I'm trying to say is, those tags better be useful to
> the general kernel audience - that means, they should be documented so
> that people can look them up - or better not be in commit messages at
> all.

Yep, I agree, but explaining all the Coverity error types in a kernel
doc is going to take some effort, which I really don't have much time
for at the moment.

> 
> Thx.
> 

Colin
