From: David Howells <dhowells@redhat.com>
Date: Fri, 12 Apr 2019 10:19:51 +0000
Subject: Re: [PATCH] dns: remove redundant zero length namelen check
Message-Id: <17756.1555064391@warthog.procyon.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190411.140203.1367510571263899902.davem@davemloft.net> <20190409125912.11600-1-colin.king@canonical.com>
In-Reply-To: <20190411.140203.1367510571263899902.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Miller <davem@davemloft.net>
Cc: dhowells@redhat.com, colin.king@canonical.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

David Miller <davem@davemloft.net> wrote:

> > The zero namelen check is redundant as it has already been checked
> > for zero at the start of the function.  Remove the redundant check.
> > 
> > Addresses-Coverity: ("Logically Dead Code")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> Applied to net-next.
> 
> However it does look like two sets of semantics were considered.
> In one case rejecting a zero namelen and in another having it
> mean whatever the strings length is modulo the max of 256.

It probably makes sense to merge the:

	if (namelen < 3 || namelen > 255)
		return -EINVAL;

check into the earlier:

	if (!name || namelen = 0)
		return -EINVAL;

check too.

David
