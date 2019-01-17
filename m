From: David Miller <davem@davemloft.net>
Date: Thu, 17 Jan 2019 19:47:53 +0000
Subject: Re: [PATCH] atm: he: fix sign-extension overflow on large shift
Message-Id: <20190117.114753.495905826813982221.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190115180338.32357-1-colin.king@canonical.com>
In-Reply-To: <20190115180338.32357-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: 3chas3@gmail.com, linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Tue, 15 Jan 2019 18:03:38 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> Shifting the 1 by exp by an int can lead to sign-extension overlow when
> exp is 31 since 1 is an signed int and sign-extending this result to an
> unsigned long long will set the upper 32 bits.  Fix this by shifting an
> unsigned long.
> 
> Detected by cppcheck:
> (warning) Shifting signed 32-bit value by 31 bits is undefined behaviour
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
