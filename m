From: Nikola Pajkovsky <n.pajkovsky@gmail.com>
Date: Sun, 19 Feb 2012 20:28:02 +0000
Subject: Re: [PATCH] b44: fix section mismatch warnings in b44.c
Message-Id: <m5sji6zhyl.fsf@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c8f624fdb13dcf32d82b1abb70a423abc4a2359a.1329662367.git.n.pajkovsky@gmail.com>
	<20120219201332.GF2855@mwanda>
In-Reply-To: <20120219201332.GF2855@mwanda> (Dan Carpenter's message of "Sun,
	19 Feb 2012 23:13:32 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Gary Zambrano <zambrano@broadcom.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, Nikola Pajkovsky <n.pajkovsky@gmail.com>

Dan Carpenter <dan.carpenter@oracle.com> writes:

> On Sun, Feb 19, 2012 at 03:45:54PM +0100, Nikola Pajkovsky wrote:
>> From: Nikola Pajkovsky <n.pajkovsky@gmail.com>
>> 
>
> This changelog is not really helpful.
>
> Why did you remove an __exit anotation instead changing the callers?
> Obviously I looked at the code, so I can answer that question, but I
> shouldn't have to.  It should be explained in the changelog.

I will rephrase comment

> Sometimes I add in information about when the error message was
> introduced.
>
> It might also be nice to mention what the bad effects of this
> problem are.
>
>> Signed-off-by: Nikola Pajkovsky <n.pajkovsky@gmail.com>
>                                    ^^^^^^^^^^^^^^^^^^^^^
> You're sending the patch from your redhat address; it's best to sign
> it with the redhat address as well.

oops, it should be from gmail

-- 
Nikola
