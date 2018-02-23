From: David Miller <davem@davemloft.net>
Date: Fri, 23 Feb 2018 17:45:03 +0000
Subject: Re: [PATCH] atm: idt77252: remove redundant bit-wise or'ing of zero
Message-Id: <20180223.124503.1376757527638095759.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180223122252.23942-1-colin.king@canonical.com>
In-Reply-To: <20180223122252.23942-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: 3chas3@gmail.com, linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Fri, 23 Feb 2018 12:22:52 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> Zero is being bit-wise or'd in a calculation twice; these are redundant
> and can be removed.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
