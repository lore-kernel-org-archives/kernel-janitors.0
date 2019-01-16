From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 16 Jan 2019 08:50:51 +0000
Subject: Re: [PATCH] atm: he: fix sign-extension overflow on large shift
Message-Id: <20190116085051.GC4482@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190115180338.32357-1-colin.king@canonical.com>
In-Reply-To: <20190115180338.32357-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Chas Williams <3chas3@gmail.com>, linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Jan 15, 2019 at 06:03:38PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Shifting the 1 by exp by an int can lead to sign-extension overlow when
> exp is 31 since 1 is an signed int and sign-extending this result to an
> unsigned long long will set the upper 32 bits.  Fix this by shifting an
> unsigned long.

You could just cast it to unsigned.

	rate_cps = (unsigned long long) (1U << exp) * (man + 512) >> 9;

I don't think it makes a difference at runtime because we just
pick buf = 4 either way...

regards,
dan carpenter
