From: Michael Ellerman <mpe@ellerman.id.au>
Date: Fri, 08 Dec 2017 11:51:50 +0000
Subject: Re: [PATCH] powerpc/xmon: use ARRAY_SIZE on various array sizing calculations
Message-Id: <87efo5h1yh.fsf@concordia.ellerman.id.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171207110134.22566-1-colin.king@canonical.com>
 <CAKTCnzmNKtg1morOPS7D3iGHFxZxd1uioex1eGtChBVppcctKA@mail.gmail.com>
In-Reply-To: <CAKTCnzmNKtg1morOPS7D3iGHFxZxd1uioex1eGtChBVppcctKA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Balbir Singh <bsingharora@gmail.com>, Colin King <colin.king@canonical.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, "open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)" <linuxppc-dev@lists.ozlabs.org>, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Balbir Singh <bsingharora@gmail.com> writes:

> On Thu, Dec 7, 2017 at 10:01 PM, Colin King <colin.king@canonical.com> wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Use the ARRAY_SIZE macro on several arrays to determine their size.
>> Improvement suggested by coccinelle.
>
> This file is taken from binutils and re-licensed. Keeping the file
> as-is helps apply newer patches easily on top as opposed to redoing
> the changes. I would prefer not to move to ARRAY_SIZE and stick to
> what's already in the file.

Yep.

Thanks but no thanks on this one Colin.

Is there a checkpatch blacklist anywhere? So we don't keep discovering
things in this file that need to be fixed?

cheers
