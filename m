From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Date: Fri, 23 Aug 2013 13:11:49 +0000
Subject: Re: [patch] [media] s5k6aa: off by one in s5k6aa_enum_frame_interval()
Message-Id: <52175F95.2040108@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130823093306.GH31293@elgon.mountain> <4319865.UMEVfJshWy@avalon>
In-Reply-To: <4319865.UMEVfJshWy@avalon>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Mauro Carvalho Chehab <m.chehab@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Laurent,

On 08/23/2013 02:54 PM, Laurent Pinchart wrote:
> Hi Dan,
> 
> Thank you for the patch.
> 
> On Friday 23 August 2013 12:33:06 Dan Carpenter wrote:
>> The check is off by one so we could read one space past the end of the
>> array.
>>
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Mauro, I have no other pending sensor patches, can you pick this one up from 
> the list, or should I send you a pull request ?

I can handle all pending patches for the Samsung sensors, I was planning
to send a pull request today. I can pick up the ov9650 patch as well.
I'd like to also include the s5k5bafx sensor patch in one of my pull
requests.

IIRC it was agreed that we as Samsung will handle our stuff ourselves
and be sending it to Mauro directly.

--
Thanks,
Sylwester
