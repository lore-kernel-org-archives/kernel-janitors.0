From: David Howells <dhowells@redhat.com>
Date: Tue, 21 Jun 2016 08:47:18 +0000
Subject: Re: [patch net-next] rxrpc: checking for IS_ERR() instead of NULL
Message-Id: <3260.1466498838@warthog.procyon.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160618084403.GC21713@mwanda>
In-Reply-To: <20160618084403.GC21713@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: dhowells@redhat.com, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> rxrpc_lookup_peer_rcu() returns NULL on error, it never returns error
> pointers.
> 
> Fixes: be6e6707f6ee ('rxrpc: Rework peer object handling to use hash table and RCU')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
