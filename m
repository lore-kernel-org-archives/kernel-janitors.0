From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Fri, 23 Aug 2013 13:16:01 +0000
Subject: Re: [patch] [media] s5k6aa: off by one in s5k6aa_enum_frame_interval()
Message-Id: <1950467.dfr4BcOJWF@avalon>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130823093306.GH31293@elgon.mountain> <4319865.UMEVfJshWy@avalon> <52175F95.2040108@samsung.com>
In-Reply-To: <52175F95.2040108@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Mauro Carvalho Chehab <m.chehab@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Sylwester,

On Friday 23 August 2013 15:11:49 Sylwester Nawrocki wrote:
> On 08/23/2013 02:54 PM, Laurent Pinchart wrote:
> > On Friday 23 August 2013 12:33:06 Dan Carpenter wrote:
> >> The check is off by one so we could read one space past the end of the
> >> array.
> >> 
> >> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > 
> > Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > Mauro, I have no other pending sensor patches, can you pick this one up
> > from the list, or should I send you a pull request ?
> 
> I can handle all pending patches for the Samsung sensors, I was planning
> to send a pull request today. I can pick up the ov9650 patch as well.
> I'd like to also include the s5k5bafx sensor patch in one of my pull
> requests.
> 
> IIRC it was agreed that we as Samsung will handle our stuff ourselves
> and be sending it to Mauro directly.

That's less work for me, so I will definitely not complain :-)

-- 
Regards,

Laurent Pinchart

