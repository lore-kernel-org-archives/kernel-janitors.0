From: Ezequiel Garcia <elezegarcia@gmail.com>
Date: Mon, 01 Oct 2012 19:49:13 +0000
Subject: Re: How to automatically get subsystem name for a file?
Message-Id: <CALF0-+VM8GjR9hT6D8drXQy_SEmKRmeUYXhGEg_1Zy4_i3M-MA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CA+MoWDrjiGQtBdr_n5TEwDJDv4pDyitKqHmruCy7-ur0GwKp0w@mail.gmail.com>
	<20121001184935.GP4587@mwanda>
In-Reply-To: <20121001184935.GP4587@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernelnewbies@lists.kernelnewbies.org

On Mon, Oct 1, 2012 at 3:49 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> On Mon, Oct 01, 2012 at 06:57:44PM +0200, Peter Senna Tschudin wrote:
>> I'm trying to figure it out how to automatically get the correct
>> subsystem string for putting on the first line of the commit message /
>> subject of the patch message. For example:
>>
>> Subject: [PATCH 001/142] arch/x86: Replace memcpy with struct assignment
>>                                        ^^^^^^^^^^
>> arch/x86 is only the first two levels of directories from Kernel
>> source. This may not be smart enough...
>>
>
> You have to do it manually.  Here are the relevant lines from my
> patch script.
>

Manually? Sure there must be some way of auto do it.
Perhaps, parsing Makefile or (if we have access to a build)
use foo.ko files.

I wonder why we don't have a standardized way of naming drivers, yet.
Something like MODULE_AUTHOR, called MODULE_NAME.

(Yes, I realize it won't work if the driver is built-in)

> git log --oneline $fullname | head -n 10
> echo "Copy and paste one of these subjects?"
> read unused
>
> You should be reading through the patch manually anyway and the
> reviewer needs to read it manually.  It's not like the 20 seconds
> it takes to consider which prefix to use is a big deal.
>

Sorry Dan, I couldn't catch what you meant by this.
I guess my english slang is not *that* sharp.

Thanks,
Ezequiel.
