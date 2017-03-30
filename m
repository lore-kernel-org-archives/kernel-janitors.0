From: David Miller <davem@davemloft.net>
Date: Thu, 30 Mar 2017 18:07:28 +0000
Subject: Re: [PATCH][V2] VSOCK: remove unnecessary ternary operator on return value
Message-Id: <20170330.110728.1080980088987923914.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170329153355.17525-1-colin.king@canonical.com>
In-Reply-To: <20170329153355.17525-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: jhansen@vmware.com, mst@redhat.com, aditr@vmware.com, georgezhang@vmware.com, stefanha@redhat.com, julia.lawall@lip6.fr, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Wed, 29 Mar 2017 16:33:55 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Rather than assign the positive errno values to ret and then
> checking if it is positive and flip the sign, just return the
> errno value.
> 
> Detected by CoverityScan, CID#986649 ("Logically Dead Code")
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to net-next, thanks.
