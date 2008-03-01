From: Jon Schindler <jkschind@gmail.com>
Date: Sat, 01 Mar 2008 02:46:21 +0000
Subject: Re: [PATCH 2/9] /drivers/net/8390.c replaced init_module&cleanup_module
Message-Id: <47C8C37D.8060808@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <47C66311.7020000@watson.wustl.edu> <20080229172406.ec0f0cd9.akpm@linux-foundation.org> <47C8C052.2040509@gmail.com>
In-Reply-To: <47C8C052.2040509@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, trivial@kernel.org, kernel-janitors@vger.kernel.org

I've also noticed another issue, it appears that I accidentally gave PATCH 2/9 the wrong subject.  Patch 2/9
actually fixes /drivers/net/ac3200.c, while PATCH 1/9 is the one that fixes /drivers/net/8390.c.  
What's the easiest way to fix these two patches?  Do you want to just back out patches 1 & 2 and 
I can send them as part of a different patch set?  If I change the subject for PATCH 2/9, it might
be hard for others to follow this thread.

Sorry for the trouble, I'm still getting familiar the mechanics of patch submission.

Jon
Jon Schindler wrote:
> I'm sorry, ns8390_init_module should be ns8390_module_init.  I'll resend it in the next reply.
> Andrew Morton wrote:
>> On Thu, 28 Feb 2008 01:30:25 -0600
>> Jon Schindler <jkschind@gmail.com> wrote:
>>
>>> Replaced init_module and cleanup_module with static functions and module_init/module_exit.
>> I get
>>
>> drivers/net/8390.c: In function '__inittest':
>> drivers/net/8390.c:60: error: 'ns8390_init_module' undeclared (first use in this function)
>> drivers/net/8390.c:60: error: (Each undeclared identifier is reported only once
>> drivers/net/8390.c:60: error: for each function it appears in.)
>> drivers/net/8390.c: At top level:
>> drivers/net/8390.c:60: error: 'init_module' aliased to undefined symbol 'ns8390_init_module'
>>
>>
> 

