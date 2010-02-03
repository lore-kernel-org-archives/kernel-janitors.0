From: Darren Jenkins <darrenrjenkins@gmail.com>
Date: Wed, 03 Feb 2010 11:33:06 +0000
Subject: Re: [PATCH] drivers/acpi/ec.c fix a small memory leak
Message-Id: <82faac5b1002030333w6eea479sb9148a329c0eb441@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1265112730.4804.8.camel@ICE-BOX> <4B684650.9070807@suse.de>
In-Reply-To: <4B684650.9070807@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexey Starikovskiy <astarikovskiy@suse.de>
Cc: Kernel Janitors <kernel-janitors@vger.kernel.org>, Len Brown <lenb@kernel.org>, linux ACPI <linux-acpi@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hello Alexey,

On Wed, Feb 3, 2010 at 2:35 AM, Alexey Starikovskiy
<astarikovskiy@suse.de> wrote:
> NAK
>
> saved_ec is allocated if flag EC_FLAGS_VALIDATE_ECDT is true.
> EC_FLAGS_SKIP_DSDT_SCAN have no sense in such case, thus this new code path
> is never executed.

From what I can tell this is not guaranteed by the code, it is relying
on DMI data not matching two of the stings at once.
However I don't know anything about DMI, so if you say this makes no
sense and will never happen I am happy.

I will mark this as ignore in the Coverity databse.

> On the other hand, unconditionally freeing pointer, which is might be NULL, is not
> right either.

Nowadays this is the preferred method actually.

> Regards,
> Alex.

Thanks for the feedback.

Darren J
