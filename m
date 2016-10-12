From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 12 Oct 2016 08:29:58 +0000
Subject: Re: [bug report] rxrpc: Add some additional call tracing
Message-Id: <20161012082958.GE5630@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161012061011.GH12841@mwanda>
In-Reply-To: <20161012061011.GH12841@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Oct 12, 2016 at 08:25:08AM +0100, David Howells wrote:
> Dan Carpenter <dan.carpenter@oracle.com> wrote:
> 
> >    278          trace_rxrpc_call(call, rxrpc_call_connected, atomic_read(&call->usage),
> >    279                           here, ERR_PTR(ret));
> >                                        ^^^^^^^^^^^^
> > Pointless.
> 
> I guess I should just cast it instead.

It's just zero or NULL always.  But if you want you can also ignore the
static checker warning since it's obviously harmless.

regards,
dan carpenter

