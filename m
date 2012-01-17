From: Julia Lawall <julia.lawall@lip6.fr>
Date: Tue, 17 Jan 2012 17:22:26 +0000
Subject: Re: [PATCH 4/15] drivers/dma/pl330.c: add missing iounmap
Message-Id: <alpine.DEB.2.02.1201171821530.1897@localhost6.localdomain6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1326362117-29371-4-git-send-email-Julia.Lawall@lip6.fr>  <1326819104.1540.166.camel@vkoul-udesk3>  <alpine.DEB.2.02.1201171754480.1897@localhost6.localdomain6> <1326820459.1540.171.camel@vkoul-udesk3>
In-Reply-To: <1326820459.1540.171.camel@vkoul-udesk3>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vinod Koul <vinod.koul@intel.com>
Cc: Dan Williams <dan.j.williams@intel.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



On Tue, 17 Jan 2012, Vinod Koul wrote:

> On Tue, 2012-01-17 at 17:55 +0100, Julia Lawall wrote:
>>>> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>>> Acked by Vinod Koul <vinod.koul@linux.intel.com>
>>>
>>> Which tree is this intended for?
>>
>> It was generated from linux-next, although I'm not sure if that is
>> the
>> intended sense of the question.
> I meant, which tree is this intended to be merged thru?
> slave-dma or any other. Since this is patch is series, typically a
> series is applied thru a single tree. If that is not the case, then I am
> happy to apply thru slave-dma :)

There is no dependency between these patches, so I think you can do 
whatever seems best with respect to this specific change.

julia
