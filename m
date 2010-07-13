From: jamal <hadi@cyberus.ca>
Date: Tue, 13 Jul 2010 15:58:14 +0000
Subject: Re: [patch] net/sched: potential data corruption
Message-Id: <1279036694.16376.0.camel@bigi>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100713132152.GL5658@bicker>
In-Reply-To: <20100713132152.GL5658@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Stephen Hemminger <shemminger@vyatta.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, matthew@wil.cx

On Tue, 2010-07-13 at 15:21 +0200, Dan Carpenter wrote:
> The reset_policy() does:
>         memset(d->tcfd_defdata, 0, SIMP_MAX_DATA);
>         strlcpy(d->tcfd_defdata, defdata, SIMP_MAX_DATA);
> 
> In the original code, the size of d->tcfd_defdata wasn't fixed and if
> strlen(defdata) was less than 31, reset_policy() would cause memory
> corruption.
> 
> Please Note:  The original alloc_defdata() assumes defdata is 32
> characters and a NUL terminator while reset_policy() assumes defdata is
> 31 characters and a NUL.  This patch updates alloc_defdata() to match
> reset_policy() (ie a shorter string).  I'm not very familiar with this
> code so please review carefully.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>


Acked-by: Jamal Hadi Salim <hadi@cyberus.ca>


cheers,
jamal

