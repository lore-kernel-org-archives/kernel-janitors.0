From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 18 Jun 2020 15:22:04 +0000
Subject: Re: [PATCH] drm/arm: fix unintentional integer overflow on left shift
Message-Id: <20200618152204.GU4151@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200618100400.11464-1-colin.king@canonical.com>
 <20200618121405.GJ159988@e110455-lin.cambridge.arm.com>
 <5d08fbec-75d8-d9a9-af61-e6ab98e77c80@canonical.com>
 <20200618142106.GK159988@e110455-lin.cambridge.arm.com>
 <CAD16O86ebsDkwbnuw2G04YZWfukqxJ=_Tex5OT07icEpfPdQNw@mail.gmail.com>
In-Reply-To: <CAD16O86ebsDkwbnuw2G04YZWfukqxJ=_Tex5OT07icEpfPdQNw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Garrit Franke <garritfranke@gmail.com>
Cc: David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Colin Ian King <colin.king@canonical.com>

On Thu, Jun 18, 2020 at 04:36:51PM +0200, Garrit Franke wrote:
> Hi all, newbie here.
> Can the BIT macro be safely used on other parts of the kernel as well?
> Just using git grep "1 <<" returns a ton of results where bit shifting
> is used the old fashioned way.

Yeah.  There is a checkpatch warning for it and everything.  :)

But I like the way you think.  Start with patches to staging though.
People don't necessarily like doing cleanups on ancient code.

regards,
dan carpenter
