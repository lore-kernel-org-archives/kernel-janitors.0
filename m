From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Tue, 22 Jan 2013 10:30:15 +0000
Subject: [PATCH] use ERR_CAST
Message-Id: <1358854166-3952-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org

ERR_CAST is more concise than PTR_ERR followed by ERR_PTR.  Using it
also occasionally removes the need for an err variable.

