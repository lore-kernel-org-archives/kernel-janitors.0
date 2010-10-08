From: T Dent <tdent48227@gmail.com>
Date: Fri, 08 Oct 2010 21:41:01 +0000
Subject: Re: [PATCH 27/33] Staging: ti-st: Makefile: replace the use of
Message-Id: <AANLkTim5wzc6wTHbjA1AtXBLRuxeVB6QGCXcHe9a0_MD@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1286496113-11897-1-git-send-email-tdent48227@gmail.com>
	<1286496113-11897-27-git-send-email-tdent48227@gmail.com>
	<20101008142434.GA23666@kroah.com>
	<AANLkTinVkaOWd7bK10CiuOh7MPz3XjSAmDnkwHLsY-pz@mail.gmail.com>
In-Reply-To: <AANLkTinVkaOWd7bK10CiuOh7MPz3XjSAmDnkwHLsY-pz@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg KH <greg@kroah.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, sam@ravnborg.org, linux-kbuild@vger.kernel.org

On 10/8/10, T Dent <tdent48227@gmail.com> wrote:
> On 10/8/10, Greg KH <greg@kroah.com> wrote:
>> On Thu, Oct 07, 2010 at 08:01:47PM -0400, Tracey Dent wrote:
>>> Changed <module>-objs to <module>-y in Makefile.
>>>
>>> Signed-off-by: Tracey Dent <tdent48227@gmail.com>
>>> ---
>>>  drivers/staging/ti-st/Makefile |    2 +-
>>>  1 files changed, 1 insertions(+), 1 deletions(-)
>>>
>>> diff --git a/drivers/staging/ti-st/Makefile
>>> b/drivers/staging/ti-st/Makefile
>>> index 0167d1d..4b6ca18 100644
>>> --- a/drivers/staging/ti-st/Makefile
>>> +++ b/drivers/staging/ti-st/Makefile
>>> @@ -3,5 +3,5 @@
>>>  # and its protocol drivers (BT, FM, GPS)
>>>  #
>>>  obj-$(CONFIG_TI_ST) 		+= st_drv.o
>>> -st_drv-objs			:= st_core.o st_kim.o st_ll.o
>>> +st_drv-y			:= st_core.o st_kim.o st_ll.o
>>>  obj-$(CONFIG_ST_BT) 		+= bt_drv.o
>>
>> For some odd reason, this patch didn't apply to the tree, but all of the
>> 32 other patches in the series did.  Care to redo this one and resend it
>> to me?
>>

The file changed, that why it cant be applied.

>
> Strange but okay.
>
>> thanks,
>>
>> greg k-h
>>
> Thanks,
>
> Tracey D
>
