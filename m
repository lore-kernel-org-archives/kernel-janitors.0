From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 19 Oct 2017 11:12:21 +0000
Subject: Re: kernel/module: Delete an error message for a failed memory allocation in add_module_usage()
Message-Id: <53f5b946-34a2-fe06-b118-d6c563e838e0@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a47bc166-7592-2ff8-9b94-4d45e18b6004@users.sourceforge.net>
 <20171019092943.hbghcaifwkcdsgd3@redbean>
 <20171019103034.kw6lthwq22vafqjx@mwanda>
 <20171019110246.7f5m5ossvq5c5jz7@redbean>
In-Reply-To: <20171019110246.7f5m5ossvq5c5jz7@redbean>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Jessica Yu <jeyu@kernel.org>, kernel-janitors@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Rusty Russell <rusty@rustcorp.com.au>, LKML <linux-kernel@vger.kernel.org>

>> This is a small allocation so it can't fail in current kernels.  I can't
>> imagine a situation where this could fail and it wasn't dead easy to
>> debug.  Most modules are loaded at boot so it's not likely to fail, but
>> if it did, it would be easy to reproduce.  If it's not loaded at boot
>> it's probably really easy to tell which module we're loading.
> 
> Yeah, good points. And on second thought, we normally don't print
> warnings for every small alloc failure in the kernel anyway (that
> would be utterly superfluous), the error code itself is sufficient.
> And in the module loader this seems to be the only printk out of the
> dozen alloc calls we do, so I'm OK with removing this one.

Thanks for your constructive feedback.

Can it help to improve the corresponding documentation for Linux
programming interfaces a bit more?

Regards,
Markus
