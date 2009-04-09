From: Jeremy Fitzhardinge <jeremy@goop.org>
Date: Thu, 09 Apr 2009 18:15:20 +0000
Subject: Re: [PATCH 55/56] xen: Remove void casts
Message-Id: <49DE3B38.4020101@goop.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <> <1239189748-11703-41-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-42-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-43-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-44-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-45-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-46-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-47-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-48-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-49-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-50-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-51-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-52-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-53-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-54-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-55-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-56-git-send-email-jwjstone@fastmail.fm> <49DDD04B.90107@fastmail.fm>
In-Reply-To: <49DDD04B.90107@fastmail.fm>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jack Stone <jwjstone@fastmail.fm>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jeff@garzik.org" <jeff@garzik.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "chrisw@sous-sol.org" <chrisw@sous-sol.org>

Jack Stone wrote:
> [Added maintainer CCs]
> Jack Stone wrote:
>   
>> Remove uneeded void casts
>>
>> Signed-Off-By: Jack Stone <jwjstone@fastmail.fm>
>>     
Acked-by: Jeremy Fitzhardinge <jeremy.fitzhardinge@citrix.com>


>> ---
>>  drivers/xen/manage.c |    2 +-
>>  1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/drivers/xen/manage.c b/drivers/xen/manage.c
>> index 0d61db1..89310fb 100644
>> --- a/drivers/xen/manage.c
>> +++ b/drivers/xen/manage.c
>> @@ -149,7 +149,7 @@ static void shutdown_handler(struct xenbus_watch *watch,
>>  	if (err)
>>  		return;
>>  
>> -	str = (char *)xenbus_read(xbt, "control", "shutdown", NULL);
>> +	str = xenbus_read(xbt, "control", "shutdown", NULL);
>>  	/* Ignore read errors and empty reads. */
>>  	if (XENBUS_IS_ERR_READ(str)) {
>>  		xenbus_transaction_end(xbt, 1);
>>   
>>     
>
>   

