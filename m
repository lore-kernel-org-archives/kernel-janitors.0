From: Namjae Jeon <linkinjeon@gmail.com>
Date: Mon, 21 Jan 2013 10:27:52 +0000
Subject: Re: [patch] f2fs: use _safe() version of list_for_each
Message-Id: <CAKYAXd-H0KHMavYRk3PEshXNtN_ke5rH_qa-8XTT6RWZXYmFcw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130120150258.GB32551@elgon.mountain>
	<20130121083245.GA11592@core.coreip.homeip.net>
	<1358760001.8234.150.camel@kjgkr>
In-Reply-To: <1358760001.8234.150.camel@kjgkr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: jaegeuk.kim@samsung.com
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>, linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

2013/1/21, Jaegeuk Kim <jaegeuk.kim@samsung.com>:
> 2013-01-21 (월), 00:32 -0800, Dmitry Torokhov:
>> On Sun, Jan 20, 2013 at 06:02:58PM +0300, Dan Carpenter wrote:
>> > This is calling list_del() inside a loop which is a problem when we try
>> > move to the next item on the list.  I've converted it to use the _safe
>> > version.  And also, as a cleanup, I've converted it to use
>> > list_for_each_entry instead of list_for_each.
>> >
>> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>> > ---
>> > Static analysis stuff.  Untested.  Please review carefully.
>>
>> Makes sense to me.
>>
>> Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>>
>
> No doubt, applied.
> Thanks,
I agree in cases – where we will have chances of parallel access and
modification to the linked we should use list_for_each_entry_safe()
But my point was related with this code change case in the patch.
We will have path like this:
f2fs_fill_super->recover_fsync_data->destroy_fsync_dnodes()
From this calling path – there can only be a single caller at any
given time. So, we will not have the case of having parallel access to
the list which is local to recover_fsync_data() and destroyed on exit
from this function.
From the real issue point of view – this does not looks convincing to
me why expensive _safe fucntion should used.

Thanks.
>
> --
> Jaegeuk Kim
> Samsung
>
