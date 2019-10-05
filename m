From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 05 Oct 2019 15:27:28 +0000
Subject: Re: [PATCH] crypto: user - fix memory leak in crypto_reportstat
Message-Id: <ddfd75b0-f0e7-8eaf-3631-95e2dc81bf63@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191004193455.18348-1-navid.emamdoost@gmail.com>
In-Reply-To: <20191004193455.18348-1-navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Navid Emamdoost <navid.emamdoost@gmail.com>, linux-crypto@vger.kernel.org
Cc: Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Stephen McCamant <smccaman@umn.edu>, "David S. Miller" <davem@davemloft.net>, Herbert Xu <herbert@gondor.apana.org.au>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> In crypto_reportstat, a new skb is created by nlmsg_new(). This skb is
> leaked if crypto_reportstat_alg() fails. Required release for skb is
> added.

Please improve this change description.

Regards,
Markus
