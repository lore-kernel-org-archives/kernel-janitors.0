From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Wed, 28 Aug 2019 09:14:31 +0000
Subject: Re: [PATCH] arcnet: capmode: remove redundant assignment to pointer pkt
Message-Id: <1e784ee7-c049-1155-ab7e-a90f1f20f3dd@cogentembedded.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190827112954.26677-1-colin.king@canonical.com>
In-Reply-To: <20190827112954.26677-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Michael Grzeschik <m.grzeschik@pengutronix.de>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hello!

On 27.08.2019 14:29, Colin King wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Pointer pkt is being initialized with a value that is never read
> and pkg is being re-assigned a little later on. The assignment is
       ^^^ pkt

> redundant and hence can be removed.
> 
> Addresses-Coverity: ("Ununsed value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
[...]

MBR, Sergei
