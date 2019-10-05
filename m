From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 05 Oct 2019 15:20:18 +0000
Subject: Re: [PATCH] crypto: user - fix memory leak in crypto_report
Message-Id: <9a7a96ce-7778-12b5-f844-25ba04e627b2@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191004192923.17491-1-navid.emamdoost@gmail.com>
In-Reply-To: <20191004192923.17491-1-navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Navid Emamdoost <navid.emamdoost@gmail.com>, linux-crypto@vger.kernel.org
Cc: Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Stephen McCamant <smccaman@umn.edu>, "David S. Miller" <davem@davemloft.net>, Herbert Xu <herbert@gondor.apana.org.au>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> In crypto_report, a new skb is created via nlmsg_new(). This skb should
> be released if crypto_report_alg() fails.

Please improve this change description.

Regards,
Markus
