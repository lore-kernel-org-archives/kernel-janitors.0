From: David Howells <dhowells@redhat.com>
Date: Wed, 12 Oct 2016 07:26:01 +0000
Subject: Re: [bug report] rxrpc: Add IPv6 support
Message-Id: <28134.1476257161@warthog.procyon.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161012061118.GI12841@mwanda>
In-Reply-To: <20161012061118.GI12841@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

>    196                  if (IS_ERR(dst)) {
>                             ^^^^^^^^^^^
> Maybe you want to check dst->error?

Hmmm...  Why don't I see this when I run checker, I wonder?

David
