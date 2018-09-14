From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Fri, 14 Sep 2018 17:54:26 +0000
Subject: Re: [PATCH] net: caif: remove redundant null check on frontpkt
Message-Id: <47b7f5a0-8b13-ead7-33b7-6e9c6ada8e61@cogentembedded.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180914171916.21298-1-colin.king@canonical.com>
In-Reply-To: <20180914171916.21298-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Dmitry Tarnyagin <dmitry.tarnyagin@lockless.no>, "David S . Miller" <davem@davemloft.net>
Cc: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org

Hello!

On 09/14/2018 08:19 PM, Colin King wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> It is impossible for frontpkt to be null at the point of the null
> check because it has been assigned from rearpkt and there is no
> way realpkt can be null at the point of the assignment because

   rearpkt?

> of the sanity checking and exit paths taken previously. Remove
> the redundant null check.
> 
> Detected by CoverityScan, CID#114434 ("Logically dead code")
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
[...]

MBR, Sergei
