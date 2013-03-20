From: David Howells <dhowells@redhat.com>
Date: Wed, 20 Mar 2013 10:23:38 +0000
Subject: Re: [patch] RxRPC: use copy_to_user() instead of memcpy()
Message-Id: <27098.1363775018@warthog.procyon.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130319225101.GZ9189@mwanda> <20130319.094240.1315516663563952557.davem@davemloft.net> <20130318105503.GA17102@longonot.mountain> <30707.1363701570@warthog.procyon.org.uk>
In-Reply-To: <20130319225101.GZ9189@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: dhowells@redhat.com, David Miller <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> Thanks for the explanation.  I misread the code and then managed to
> trigger an unrelated locking bug and got confused.
> 
> I think there is a spin_unlock(call->lock) missing somewhere on an
> error path.  I have attached a reproducer file.

Are you running with lockdep enabled?  That should catch such things.

David
