From: Vasiliy Kulikov <segooon@gmail.com>
Date: Fri, 07 Jan 2011 14:02:34 +0000
Subject: Re: [patch] [media] av7110: make array offset unsigned
Message-Id: <20110107140234.GA8107@albatros>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110106194059.GC1717@bicker>
 <4D270A9F.7080104@linuxtv.org>
 <20110107135122.GI1717@bicker>
In-Reply-To: <20110107135122.GI1717@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Andreas Oberritter <obi@linuxtv.org>, Mauro Carvalho Chehab <mchehab@infradead.org>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Jan 07, 2011 at 16:51 +0300, Dan Carpenter wrote:
> But just for my own understanding, why is it wrong to change an int to
> an unsigned int in the userspace API?  Who would notice?

E.g. the same check in userspace (var < 0).  If var has changed the sign
then the result would differ.

-- 
Vasiliy
