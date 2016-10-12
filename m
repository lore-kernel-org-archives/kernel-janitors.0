From: David Howells <dhowells@redhat.com>
Date: Wed, 12 Oct 2016 14:59:02 +0000
Subject: Re: [bug report] rxrpc: Add some additional call tracing
Message-Id: <7164.1476284342@warthog.procyon.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161012061011.GH12841@mwanda>
In-Reply-To: <20161012061011.GH12841@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> It's just zero or NULL always.  But if you want you can also ignore the
> static checker warning since it's obviously harmless.

Ah, yes.  The trace line used to be before the error check, but now there's a
separate trace line for that.

David
