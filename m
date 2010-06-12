From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date: Sat, 12 Jun 2010 14:21:01 +0000
Subject: Re: [patch] mtd/sst25l: check for null consistently
Message-Id: <1276352461.19028.120.camel@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100522201626.GJ22515@bicker>
In-Reply-To: <20100522201626.GJ22515@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <error27@gmail.com>
Cc: kernel-janitors@vger.kernel.org, H Hartley Sweeten <hsweeten@visionengravers.com>, Andre Renaud <andre@bluewatersys.com>, linux-mtd@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>, David Woodhouse <dwmw2@infradead.org>

On Sat, 2010-05-22 at 22:16 +0200, Dan Carpenter wrote:
> The rest of the function assumes that "data" can be null.  I don't know
> the code well enough to say whether it can actually be null, but there 
> is no harm in checking here.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Pushed to l2-mtd-2.6.git, Thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)

