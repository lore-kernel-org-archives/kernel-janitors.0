From: David Howells <dhowells@redhat.com>
Date: Wed, 12 Oct 2016 07:25:08 +0000
Subject: Re: [bug report] rxrpc: Add some additional call tracing
Message-Id: <28102.1476257108@warthog.procyon.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161012061011.GH12841@mwanda>
In-Reply-To: <20161012061011.GH12841@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

>    278          trace_rxrpc_call(call, rxrpc_call_connected, atomic_read(&call->usage),
>    279                           here, ERR_PTR(ret));
>                                        ^^^^^^^^^^^^
> Pointless.

I guess I should just cast it instead.

David
