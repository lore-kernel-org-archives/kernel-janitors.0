From: Manu Abraham <abraham.manu@gmail.com>
Date: Tue, 18 Feb 2014 03:55:40 +0000
Subject: Re: [patch] [media] stv090x: remove indent levels
Message-Id: <CAHFNz9LMU0X2YsqniY+6VOS_mM-jUfAvP2sF5MFNdwWWwEVgsw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140206092800.GB31780@elgon.mountain>
In-Reply-To: <20140206092800.GB31780@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mauro Carvalho Chehab <m.chehab@samsung.com>, Hans Verkuil <hans.verkuil@cisco.com>, Alexey Khoroshilov <khoroshilov@ispras.ru>, Linux Media Mailing List <linux-media@vger.kernel.org>, kernel-janitors@vger.kernel.org

Hi Dan,

On Thu, Feb 6, 2014 at 2:58 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> 1) We can flip the "if (!lock)" check to "if (lock) return lock;" and
>    then remove a big chunk of indenting.
> 2) There is a redundant "if (!lock)" which we can remove since we
>    already know that lock is zero.  This removes another indent level.


The stv090x driver is a mature, but slightly complex driver supporting
quite some
different configurations. Is it that some bug you are trying to fix in there ?
I wouldn't prefer unnecessary code churn in such a driver for
something as simple
as gain in an indentation level.


Thanks,

Manu
