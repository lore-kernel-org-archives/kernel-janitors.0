From: T Dent <tdent48227@gmail.com>
Date: Wed, 06 Oct 2010 02:01:27 +0000
Subject: Re: [PATCH 01/28] Staging: comedi: comedi.h: Edit file so
Message-Id: <AANLkTikmKH4veQPFQ4ob4_UDbCf20esgM7QZ+uZYXsVH@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1286326843-6170-1-git-send-email-tdent48227@gmail.com>
	<20101006015038.GA22340@kroah.com>
In-Reply-To: <20101006015038.GA22340@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg KH <greg@kroah.com>
Cc: abbotti@mev.co.uk, fmhess@users.sourceforge.net, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 10/5/10, Greg KH <greg@kroah.com> wrote:
> On Tue, Oct 05, 2010 at 09:00:16PM -0400, Tracey Dent wrote:
>> Changed lines in the file so that checkpatch.pl wont complain. Fixed every
>> warning/error message such as; WARNING: storage class should be at the
>> beginning of the declaration, WARNING: please, no space for starting a
>> line, and last but not least WARNING: line over 80 characters.
>
> Your changelog comment is longer than 80 characters wide :)
>
Ik sorry about that.
>>
>> Signed-off-by: Tracey Dent <tdent48227@gmail.com>
>> ---
>>  drivers/staging/comedi/comedi.h |   78
>> ++++++++++++++++++++-------------------
>>  1 files changed, 40 insertions(+), 38 deletions(-)
>>
>> diff --git a/drivers/staging/comedi/comedi.h
>> b/drivers/staging/comedi/comedi.h
>> index 6c900e2..680cef8 100644
>> --- a/drivers/staging/comedi/comedi.h
>> +++ b/drivers/staging/comedi/comedi.h
>> @@ -1,23 +1,23 @@
>>  /*
>> -    include/comedi.h (installed as /usr/include/comedi.h)
>> -    header file for comedi
>> +	include/comedi.h (installed as /usr/include/comedi.h)
>> +	header file for comedi
>>
>> -    COMEDI - Linux Control and Measurement Device Interface
>> -    Copyright (C) 1998-2001 David A. Schleef <ds@schleef.org>
>> +	COMEDI - Linux Control and Measurement Device Interface
>> +	Copyright (C) 1998-2001 David A. Schleef <ds@schleef.org>
>
> Ick, no, these are all just fine, they are not an issue, go bug the
> checkpatch.pl author about resolving this.  These comments don't need to
> be changed, sorry.

I thought that I just wanted to get rid of the all the warnings. The
author should take it out if its not an issue.
>
> thanks,
>
> greg k-h
thanks,

Tracey D
