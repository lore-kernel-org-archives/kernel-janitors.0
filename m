From: Colin Ian King <colin.king@canonical.com>
Date: Fri, 30 Aug 2019 14:06:52 +0000
Subject: Re: [PATCH] afs: use BIT_ULL for shifting to fix integer overflow
Message-Id: <0a5df84f-920f-d2aa-69d6-963b40142f1f@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190830104912.1090-1-colin.king@canonical.com>
 <3079.1567173701@warthog.procyon.org.uk>
In-Reply-To: <3079.1567173701@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Howells <dhowells@redhat.com>
Cc: linux-afs@lists.infradead.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 30/08/2019 15:01, David Howells wrote:
> Colin King <colin.king@canonical.com> wrote:
> 
>> The expression 1 << nr_slots is evaluated with 32 bit integer arithmetic
>> and can overflow before it is widened.
> 
> If it does, it's an error on the part of the caller.  See the banner comment:
> 1 <= nr_slots <= 9.

Doh, totally missed that. My bad.

> 
> And, in any case, if nr_slots >= 64, using BIT_ULL wouldn't help...
> 
> David
> 
