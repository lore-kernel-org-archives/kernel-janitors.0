From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 27 Oct 2017 18:04:17 +0000
Subject: Re: misc: bh1770glc: Use common error handling code in bh1770_power_state_store()
Message-Id: <8e931bdb-5327-000e-3167-6634ce349f73@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <568ee0ee-8ff1-9739-fa6b-f2eeae53e11a@users.sourceforge.net>
 <9c0b957a-93b5-39c9-f9bd-cb754d009d62@grinta.net>
In-Reply-To: <9c0b957a-93b5-39c9-f9bd-cb754d009d62@grinta.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Daniele Nicolodi <daniele@grinta.net>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Jonathan Cameron <jic23@kernel.org>, Samu Onkalo <samu.p.onkalo@nokia.com>

>> Adjust jump targets so that a bit of exception handling can be better
>> reused in an if branch of this function.
> 
> What is the benefit brought by this change?

Will you notice that the object code size can be a bit smaller
because the call of the function “pm_runtime_put” is specified at
two places in the implementation in comparison to three places before?


> Anyhow, are you seriously suggesting adding a goto to a label define
> within a if block?

Yes. - For this update suggestion.


> Is this somehow an Halloween related joke?

I hope not.

Another software design approach would be to move two statements from
the affected if branch to the end of this function. Such an adjustment
would have the consequence that the statement “goto unlock” will be
transformed into a jump to a backward target.
Would you prefer such an implementation variant instead?

Regards,
Markus
