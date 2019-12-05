From: David Miller <davem@davemloft.net>
Date: Thu, 05 Dec 2019 01:09:28 +0000
Subject: Re: [PATCH][V2] qed: remove redundant assignments to rc
Message-Id: <20191204.170928.536021818533653039.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191204114442.1413895-1-colin.king@canonical.com>
In-Reply-To: <20191204114442.1413895-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: aelior@marvell.com, GR-everest-linux-l2@marvell.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Wed,  4 Dec 2019 11:44:42 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable rc is assigned with a value that is never read and
> it is re-assigned a new value later on.  The assignment is redundant
> and can be removed.  Clean up multiple occurrances of this pattern.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

This really is a cleanup, and doesn't fix any bugs.

Therefore, please resubmit this when net-next opens back up.

Thank you.
