From: David Howells <dhowells@redhat.com>
Date: Wed, 11 Apr 2018 16:03:48 +0000
Subject: Re: [PATCH][next] afs: fix integer overflow when shifting 1 more than 32 places
Message-Id: <2495.1523462628@warthog.procyon.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180411155811.2qznymjhi6zlzgbb@mwanda> <62e9abc2-b639-419c-afa7-e89054f7dce9@canonical.com> <20180411132613.18974-1-colin.king@canonical.com> <23535.1523453966@warthog.procyon.org.uk> <24493.1523455816@warthog.procyon.org.uk>
In-Reply-To: <20180411155811.2qznymjhi6zlzgbb@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: dhowells@redhat.com, Colin Ian King <colin.king@canonical.com>, linux-afs@lists.infradead.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> Ideally static analyzers should know that nr_slots is 0-9, but right now
> that seems pretty tricky to figure out...

1-9, actually, but, yeah.  Maybe the addition of "assertions" that aren't
actually evaluated at runtime?

David
