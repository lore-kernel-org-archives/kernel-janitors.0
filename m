From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 10 Jun 2020 20:00:24 +0000
Subject: Re: exfat: add missing brelse() calls on error paths
Message-Id: <015e5093-d139-6bee-ca45-4cb0e871e65d@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200610172213.GA90634@mwanda>
 <740ce77a-5404-102b-832f-870cbec82d56@web.de> <20200610184517.GC4282@kadam>
 <b44caf20-d3fc-30ac-f716-2375ed55dc9a@web.de>
 <20200610192244.GK19604@bombadil.infradead.org>
In-Reply-To: <20200610192244.GK19604@bombadil.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Wilcox <willy@infradead.org>, linux-fsdevel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Namjae Jeon <namjae.jeon@samsung.com>, Sungjong Seo <sj1557.seo@samsung.com>, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>, Tetsuhiro Kohada <kohada.t2@gmail.com>, Wei Yongjun <weiyongjun1@huawei.com>, Dan Carpenter <dan.carpenter@oracle.com>

> You're nitpicking commit messages.

I am occasionally trying to achieve corresponding improvements.


> This is exactly the kind of thing which drives people away.

Would you like to follow official patch process documentation?


> Dan's commit message is fine.

I have got the impression that he indicates another deviation from
a well-known requirement. I am curious under which circumstances
such a patch review concern will be taken into account finally.


> It's actually hilarious because your emails are so unclear that I
> can't understand them.

I find such feedback surprising and interesting.
I hope that we can reduce understanding difficulties together.


> I have no idea what "collateral evolution" means

This term expresses the situation that a single change can trigger
further changes.

Examples for programmers:
A)
* You add an argument to an used function.
* How many function calls will need related adjustments?

B)
* Some function calls can fail.
* How do you think about to complete error detection and the
  corresponding exception handling?


> and yet you use it in almost every email.

You exaggerate here.


> Why can't you use the same terminology the rest of us use?

I got also used to some wording approaches.
Which terminology variation do you prefer?

Regards,
Markus
