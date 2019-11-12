From: David Miller <davem@redhat.com>
Date: Tue, 12 Nov 2019 06:05:29 +0000
Subject: Re: [PATCH][next] tipc: fix update of the uninitialized variable err
Message-Id: <20191111.220529.1787748247936127753.davem@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191111123334.68401-1-colin.king@canonical.com>
In-Reply-To: <20191111123334.68401-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: jon.maloy@ericsson.com, ying.xue@windreiver.com, tuong.t.lien@dektech.com.au, netdev@vger.kernel.org, tipc-discussion@lists.sourceforge.net, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Mon, 11 Nov 2019 12:33:34 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable err is not uninitialized and hence can potentially contain
> any garbage value.  This may cause an error when logical or'ing the
> return values from the calls to functions crypto_aead_setauthsize or
> crypto_aead_setkey.  Fix this by setting err to the return of
> crypto_aead_setauthsize rather than or'ing in the return into the
> uninitialized variable
> 
> Addresses-Coverity: ("Uninitialized scalar variable")
> Fixes: fc1b6d6de220 ("tipc: introduce TIPC encryption & authentication")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
