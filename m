From: Colin Ian King <colin.king@canonical.com>
Date: Wed, 11 Apr 2018 13:42:47 +0000
Subject: Re: [PATCH][next] afs: fix integer overflow when shifting 1 more than 32 places
Message-Id: <62e9abc2-b639-419c-afa7-e89054f7dce9@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180411132613.18974-1-colin.king@canonical.com>
 <23535.1523453966@warthog.procyon.org.uk>
In-Reply-To: <23535.1523453966@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Howells <dhowells@redhat.com>
Cc: linux-afs@lists.infradead.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 11/04/18 14:39, David Howells wrote:
> Colin King <colin.king@canonical.com> wrote:
> 
>> Shifting 1 (a 32 bit signed int) more than 32 places will overflow
>> the int, so explicitly use 1ULL to avoid this overflow.
>> ...
>> -	mask = (1 << nr_slots) - 1;
>> +	mask = (1ULL << nr_slots) - 1;
> 
> nr_slots cannot be larger than 9, so what I wrote is actually fine and is more
> efficient on a 32-bit machine.

ok, sorry about the noise.

> 
> David
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

