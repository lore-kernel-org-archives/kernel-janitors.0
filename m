From: David Howells <dhowells@redhat.com>
Date: Thu, 11 Oct 2018 20:38:43 +0000
Subject: Re: [PATCH net-next] rxrpc: Remove set but not used variable 'ioc'
Message-Id: <19793.1539290323@warthog.procyon.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181011083807.tvhfguimyw7glrtp@mwanda> <1539052273-34824-1-git-send-email-yuehaibing@huawei.com> <11853.1539079996@warthog.procyon.org.uk>
In-Reply-To: <20181011083807.tvhfguimyw7glrtp@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: dhowells@redhat.com, YueHaibing <yuehaibing@huawei.com>, davem@davemloft.net, linux-afs@lists.infradead.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> I told him to do that because it wasn't a bugfix...  Probably just Fixes
> is the right thing to use though.

But the correct fix *is* a bug fix.

David
