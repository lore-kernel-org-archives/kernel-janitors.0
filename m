From: David Miller <davem@davemloft.net>
Date: Wed, 29 Mar 2017 04:49:58 +0000
Subject: Re: [PATCH] VSOCK: remove unnecessary ternary operator on return value
Message-Id: <20170328.214958.1031055485189943869.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170328155424.22873-1-colin.king@canonical.com>
In-Reply-To: <20170328155424.22873-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: jhansen@vmware.com, aditr@vmware.com, julia.lawall@lip6.fr, stefanha@redhat.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Tue, 28 Mar 2017 16:54:24 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Rather than assign the positive errno values to ret and then
> checking if it is positive and flip the sign, just set ret to
> be the -ve errno value.
> 
> Detected by CoverityScan, CID#986649 ("Logically Dead Code")
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Just return the error directly instead of having this variable.

Thanks.
