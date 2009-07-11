From: Jiri Slaby <jirislaby@gmail.com>
Date: Sat, 11 Jul 2009 11:06:45 +0000
Subject: Re: [PATCH 5/5] staging/otus: Move a dereference below a NULL test
Message-Id: <4A587245.1080304@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0907110950510.29592@ask.diku.dk>	 <4A584A94.5010105@gmail.com> <1247307444.3032.2.camel@hpdv5.satnam>
In-Reply-To: <1247307444.3032.2.camel@hpdv5.satnam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaswinder Singh Rajput <jaswinder@kernel.org>
Cc: Julia Lawall <julia@diku.dk>, gregkh@suse.de, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 07/11/2009 12:17 PM, Jaswinder Singh Rajput wrote:
> On Sat, 2009-07-11 at 10:17 +0200, Jiri Slaby wrote:
>> On 07/11/2009 09:51 AM, Julia Lawall wrote:
>>> --- a/drivers/staging/otus/wwrap.c
>>> +++ b/drivers/staging/otus/wwrap.c
>>> @@ -1016,12 +1016,13 @@ void kevent(struct work_struct *work)
>>>  {
>>>      struct usbdrv_private *macp >>>                 container_of(work, struct usbdrv_private, kevent);
>>> -    zdev_t *dev = macp->device;
>>> +    zdev_t *dev;
>>>  
>>>      if (macp = NULL)
>>>      {
>>>          return;
>>>      }
>>
>> The test is rather useless here.
>>
> 
> Why useless, it should be non-null before setting to dev.

Even if work was NULL, macp won't be NULL.

> But issue is why function name like kevent() is global and who is using
> it.

Since it's not declared, I guess nobody but keventd. It should be static.
