From: David Miller <davem@davemloft.net>
Date: Thu, 02 Apr 2020 13:51:26 +0000
Subject: Re: [PATCH][next] net: atlantic: fix missing | operator when assigning rec->llc
Message-Id: <20200402.065126.1342599499039366040.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200401232736.410028-1-colin.king@canonical.com>
In-Reply-To: <20200401232736.410028-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: irusskikh@marvell.com, mstarovoitov@marvell.com, dbogdanov@marvell.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Thu,  2 Apr 2020 00:27:36 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> rec->llc is currently being assigned twice, once with the lower 8 bits
> from packed_record[8] and then re-assigned afterwards with data from
> packed_record[9].  This looks like a type, I believe the second assignment
> should be using the |= operator rather than a direct assignment.
> 
> Addresses-Coverity: ("Unused value")
> Fixes: b8f8a0b7b5cb ("net: atlantic: MACSec ingress offload HW bindings")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks.
