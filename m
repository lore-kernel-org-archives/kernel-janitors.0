From: David Howells <dhowells@redhat.com>
Date: Fri, 30 Aug 2019 14:01:41 +0000
Subject: Re: [PATCH] afs: use BIT_ULL for shifting to fix integer overflow
Message-Id: <3079.1567173701@warthog.procyon.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190830104912.1090-1-colin.king@canonical.com>
In-Reply-To: <20190830104912.1090-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: dhowells@redhat.com, linux-afs@lists.infradead.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> The expression 1 << nr_slots is evaluated with 32 bit integer arithmetic
> and can overflow before it is widened.

If it does, it's an error on the part of the caller.  See the banner comment:
1 <= nr_slots <= 9.

And, in any case, if nr_slots >= 64, using BIT_ULL wouldn't help...

David
