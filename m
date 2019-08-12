From: David Howells <dhowells@redhat.com>
Date: Mon, 12 Aug 2019 12:05:14 +0000
Subject: Re: [PATCH][net-next] rxrpc: fix uninitialized return value in variable err
Message-Id: <17308.1565611514@warthog.procyon.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190809170259.29859-1-colin.king@canonical.com>
In-Reply-To: <20190809170259.29859-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: dhowells@redhat.com, "David S . Miller" <davem@davemloft.net>, linux-afs@lists.infradead.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> Fixes: b214b2d8f277 ("rxrpc: Don't use skb_cow_data() in rxkad")

This isn't in net or net-next and has been superseded in any case.

You can find it still in my afs-next branch, but the replacement in
rxrpc-fixes is fixed differently.

David
