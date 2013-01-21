From: Namjae Jeon <linkinjeon@gmail.com>
Date: Mon, 21 Jan 2013 12:04:15 +0000
Subject: Re: [patch] f2fs: use _safe() version of list_for_each
Message-Id: <CAKYAXd9MONk+mwHSXnoUTVVHqFytFPpfth1uvpcKx9q=g2yPWw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130120150258.GB32551@elgon.mountain>
	<20130121083245.GA11592@core.coreip.homeip.net>
	<1358760001.8234.150.camel@kjgkr>
	<CAKYAXd-H0KHMavYRk3PEshXNtN_ke5rH_qa-8XTT6RWZXYmFcw@mail.gmail.com>
	<20130121112424.GV16282@mwanda>
In-Reply-To: <20130121112424.GV16282@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: jaegeuk.kim@samsung.com, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

2013/1/21, Dan Carpenter <dan.carpenter@oracle.com>:
> I sometimes write little user space programs to help me check my
> work.  I've attached one.
>
> gcc test.c
> ./a.out
>
> regards,
> dan carpenter
>
Hi Dan.
Thanks for testcase. I understand fully.
list_for_each still use pos after removing pos in loop. So, we need to
use _safe function to get pos->next safely.

Thanks.
