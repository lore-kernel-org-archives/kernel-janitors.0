From: David Miller <davem@davemloft.net>
Date: Fri, 11 Sep 2020 21:48:42 +0000
Subject: Re: [PATCH] ipv6: remove redundant assignment to variable err
Message-Id: <20200911.144842.1644303060226035755.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200911103509.22907-1-colin.king@canonical.com>
In-Reply-To: <20200911103509.22907-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: kuznet@ms2.inr.ac.ru, yoshfuji@linux-ipv6.org, kuba@kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Fri, 11 Sep 2020 11:35:09 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable err is being initialized with a value that is never read and
> it is being updated later with a new value. The initialization is redundant
> and can be removed.  Also re-order variable declarations in reverse
> Christmas tree ordering.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
