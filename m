From: David Miller <davem@davemloft.net>
Date: Sun, 30 Dec 2018 20:33:50 +0000
Subject: Re: [PATCH] net/ipv6: Fix a test against 'ipv6_find_idev()' return value
Message-Id: <20181230.123350.1719727923588813351.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181228222821.20332-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20181228222821.20332-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: kuznet@ms2.inr.ac.ru, yoshfuji@linux-ipv6.org, sd@queasysnail.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 28 Dec 2018 23:28:21 +0100

> 'ipv6_find_idev()' returns NULL on error, not an error pointer.
> Update the test accordingly and return -ENOBUFS, as already done in
> 'addrconf_add_dev()', if NULL is returned.
> 
> Fixes: ("ipv6: allow userspace to add IFA_F_OPTIMISTIC addresses")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied and queued up for -stable.

Please provide the SHA1_ID in the Fixes: tag next time, I fixed it up
for you.
