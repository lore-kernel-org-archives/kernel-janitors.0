From: David Howells <dhowells@redhat.com>
Date: Fri, 27 May 2016 14:02:36 +0000
Subject: Re: [patch] KEYS: potential uninitialized variable
Message-Id: <30051.1464357756@warthog.procyon.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160526064559.GA6738@mwanda>
In-Reply-To: <20160526064559.GA6738@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> If __key_link_begin() failed then "edit" would be uninitialized.  I've
> added a check to fix that.
> 
> Fixes: f70e2e06196a ('KEYS: Do preallocation for __key_link()')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
