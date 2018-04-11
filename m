From: David Howells <dhowells@redhat.com>
Date: Wed, 11 Apr 2018 13:39:26 +0000
Subject: Re: [PATCH][next] afs: fix integer overflow when shifting 1 more than 32 places
Message-Id: <23535.1523453966@warthog.procyon.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180411132613.18974-1-colin.king@canonical.com>
In-Reply-To: <20180411132613.18974-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: dhowells@redhat.com, linux-afs@lists.infradead.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> Shifting 1 (a 32 bit signed int) more than 32 places will overflow
> the int, so explicitly use 1ULL to avoid this overflow.
> ...
> -	mask = (1 << nr_slots) - 1;
> +	mask = (1ULL << nr_slots) - 1;

nr_slots cannot be larger than 9, so what I wrote is actually fine and is more
efficient on a 32-bit machine.

David
