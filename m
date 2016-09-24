From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 24 Sep 2016 19:50:54 +0000
Subject: Re: Input-gameport: Replace some printk() calls by pr_info() in joydump_connect()
Message-Id: <fd0413a5-d181-8ee1-37bb-f47cc8a7ac45@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d8da8333-d83a-ca61-b887-7fd7528c63a4@users.sourceforge.net>
 <f486d64d-0759-9cd6-1e4e-df723acb6fea@users.sourceforge.net>
 <1474733610.23838.2.camel@perches.com>
 <8164eb48-e3fa-fa9d-6351-f14b595a6dc3@users.sourceforge.net>
 <1474735656.23838.6.camel@perches.com>
In-Reply-To: <1474735656.23838.6.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: linux-input@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

>> Should the desired output be the same when the relevant data are passed by a single function call
>> (instead of three as before)?
> 
> Adding a singleton for a pr_fmt #define constant string and
> updating the printk subsystem to prepend that constant string
> to each use of a pr_<level> at runtime would be an improvement
> as it could reduce constant data used by the format strings.

Thanks for for this constructive feedback.


> That would be a _real_ improvement.

This sounds interesting for me too.


> Please try to implement something like that before submitting
> more of these incorrect patches.

Nice wish!

Did any other software developer try to implement such enhanced
logging functionality already?

Regards,
Markus
