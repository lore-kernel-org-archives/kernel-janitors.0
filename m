From: Jason Gerecke <killertofu@gmail.com>
Date: Wed, 16 Dec 2015 17:49:56 +0000
Subject: Re: [patch] HID: wacom: bitwise vs logical ORs
Message-Id: <CANRwn3TvwFr85A=dbVTY2gXVdL0y=uw10f1eJBLYWzd3BfNg1Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151209102205.GB3173@mwanda>
	<alpine.LNX.2.00.1512161557060.9922@cbobk.fhfr.pm>
In-Reply-To: <alpine.LNX.2.00.1512161557060.9922@cbobk.fhfr.pm>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Jiri Kosina <jikos@kernel.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, Henrik Rydberg <rydberg@bitmath.org>, Linux Input <linux-input@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Dec 16, 2015 at 6:57 AM, Jiri Kosina <jikos@kernel.org> wrote:
> On Wed, 9 Dec 2015, Dan Carpenter wrote:
>
>> Smatch complains that these should probably be bitwise ORs instead of
>> logical.  It doesn't matter for "prox" but it makes a difference for
>> "strip1" and "strip2".
>>
>> Fixes: c7f0522a1ad1 ('HID: wacom: Slim down wacom_intuos_pad processing')
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> Jason, could you please provide your Ack for this one?
>
> It's obviously a Correct Thing To Do(TM), but I assume you've tested on
> your devices with this patch, so some other changes might potentially be
> needed to "compensate" for the fix ...
>
> Thanks,
>
> --
> Jiri Kosina
> SUSE Labs
>

This patch looks fine to me (the 'prox' calculation /should/ be
logical, but I suppose bitwise works too :D). Found two other bugs
from c7f0522 while reviewing though -- I'll have patches for you
shortly.

Reviewed-by: Jason Gerecke <jason.gerecke@wacom.com>

Jason
---
Now instead of four in the eights place /
you’ve got three, ‘Cause you added one  /
(That is to say, eight) to the two,     /
But you can’t take seven from three,    /
So you look at the sixty-fours....
