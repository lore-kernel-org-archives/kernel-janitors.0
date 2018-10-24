From: Kalle Valo <kvalo@codeaurora.org>
Date: Wed, 24 Oct 2018 12:58:17 +0000
Subject: Re: [PATCH] ath9k: Fix a locking bug in ath9k_add_interface()
Message-Id: <87woq7qz6e.fsf@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181019200842.7qclbjs547sm7mbn@kili.mountain>
        <87tvlbuc3n.fsf@codeaurora.org>
        <20181024125630.pqs6uae3owjvfdhr@mwanda>
In-Reply-To: <20181024125630.pqs6uae3owjvfdhr@mwanda> (Dan Carpenter's message
        of "Wed, 24 Oct 2018 15:56:30 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: QCA ath9k Development <ath9k-devel@qca.qualcomm.com>, Felix Fietkau <nbd@nbd.name>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

> On Wed, Oct 24, 2018 at 08:50:52AM +0300, Kalle Valo wrote:
>> Dan Carpenter <dan.carpenter@oracle.com> writes:
>> 
>> > We tried to revert commit d9c52fd17cb4 ("ath9k: fix tx99 with monitor
>> > mode interface") but accidentally missed part of the locking change.
>> >
>> > The lock has to be held earlier so that we're holding it when we do
>> > "sc->tx99_vif = vif;" and also there in the current code there is a
>> > stray unlock before we have taken the lock.
>> >
>> > Fixes: 6df0580be8bc ("ath9k: add back support for using active
>> > monitor interfaces for tx99")
>> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>> 
>> commit 6df0580be8bc is on it's way to v4.20 so should I also queue this
>> to v4.20?
>
> Yeah.  Obviously this is a static checker thing and I haven't tested it.
>
> I don't know if add_interface() is ever called in parallel, but I can
> imagine that it might be.  In that case the race condition is something
> that would affect real life.
>
> Anyway, it's a small obvious fix.

Ok, I'll then queue this to v4.20. But I would appreciate if others
could test or review this.

-- 
Kalle Valo
