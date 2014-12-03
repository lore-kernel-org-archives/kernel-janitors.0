From: Daniel Borkmann <dborkman@redhat.com>
Date: Wed, 03 Dec 2014 00:18:41 +0000
Subject: Re: [PATCH 8/8] wusb: replace memset by memzero_explicit
Message-Id: <547E56E1.2080105@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1417366774-32412-1-git-send-email-Julia.Lawall@lip6.fr> <1417366774-32412-9-git-send-email-Julia.Lawall@lip6.fr> <20141203001408.GB21569@kroah.com>
In-Reply-To: <20141203001408.GB21569@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Julia Lawall <Julia.Lawall@lip6.fr>, herbert@gondor.apana.org.au, kernel-janitors@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Julia Lawall <julia@diku.dk>

On 12/03/2014 01:14 AM, Greg Kroah-Hartman wrote:
> On Sun, Nov 30, 2014 at 05:59:34PM +0100, Julia Lawall wrote:
>> From: Julia Lawall <julia@diku.dk>
>>
>> Memset on a local variable may be removed when it is called just before the
>> variable goes out of scope.  Using memzero_explicit defeats this
>> optimization.  A simplified version of the semantic patch that makes this
>> change is as follows: (http://coccinelle.lip6.fr/)
>>
>> // <smpl>
>> @@
>> identifier x;
>> type T;
>> @@
>>
>> {
>> ... when any
>> T x[...];
>> ... when any
>>      when exists
>> - memset
>> + memzero_explicit
>>    (x,
>> -0,
>>    ...)
>> ... when != x
>>      when strict
>> }
>> // </smpl>
>>
>> This change was suggested by Daniel Borkmann <dborkman@redhat.com>
>>
>> Signed-off-by: Julia Lawall <julia@diku.dk>
>>
>> ---
>> Daniel Borkmann suggested that these patches could go through Herbert Xu's
>> cryptodev tree.
>
> Why?  There's no dependancy on anything in the cryptodev tree,
> memzero_explicit is in Linus's tree now.

Sorry, I guess this was not really clear, that comment actually only
refers to the arch/*/crypto/ patches.

Anyway, thanks for queueing this up, Greg.

Cheers,
Daniel
