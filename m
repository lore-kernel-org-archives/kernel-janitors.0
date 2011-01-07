From: Dan Carpenter <error27@gmail.com>
Date: Fri, 07 Jan 2011 13:51:22 +0000
Subject: Re: [patch] [media] av7110: make array offset unsigned
Message-Id: <20110107135122.GI1717@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110106194059.GC1717@bicker>
 <4D270A9F.7080104@linuxtv.org>
In-Reply-To: <4D270A9F.7080104@linuxtv.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Oberritter <obi@linuxtv.org>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Jan 07, 2011 at 01:44:15PM +0100, Andreas Oberritter wrote:
> Nack. You're changing an interface to userspace. Please add a check to
> av7110_ca.c instead.
> 

Ok.  I've done that and resent the patch.

But just for my own understanding, why is it wrong to change an int to
an unsigned int in the userspace API?  Who would notice?  (I'm still
quite a newbie at system programming).

regards,
dan carpenter

