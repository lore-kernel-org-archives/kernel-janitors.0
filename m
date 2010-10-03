From: T Dent <tdent48227@gmail.com>
Date: Sun, 03 Oct 2010 13:39:31 +0000
Subject: Re: [PATCH v3 11/20] Staging: rtl8192su: Makefile: cleaned up
Message-Id: <AANLkTi=MohCHAZrwoVGauP2w8kRBrXd_Yrc+6pQg8j0+@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1286037489-28439-1-git-send-email-tdent48227@gmail.com>
	<1286037489-28439-11-git-send-email-tdent48227@gmail.com>
	<4CA87A47.6030007@bfs.de>
In-Reply-To: <4CA87A47.6030007@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: wharms@bfs.de
Cc: greg@kroah.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, sam@ravnborg.org

On 10/3/10, walter harms <wharms@bfs.de> wrote:
>
>
> Tracey Dent schrieb:
>> Changed to use the proper ccflags-y option
>>
>> Signed-off-by: Tracey Dent <tdent48227@gmail.com>
>> ---
>>  drivers/staging/rtl8192su/Makefile |   10 +++++-----
>>  1 files changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/staging/rtl8192su/Makefile
>> b/drivers/staging/rtl8192su/Makefile
>> index 7133894..1120c04 100644
>> --- a/drivers/staging/rtl8192su/Makefile
>> +++ b/drivers/staging/rtl8192su/Makefile
>> @@ -1,12 +1,12 @@
>>  NIC_SELECT = RTL8192SU
>>
>> -EXTRA_CFLAGS += -std=gnu89
>> -EXTRA_CFLAGS += -O2
>> +ccflags-y := -std=gnu89
>> +ccflags-y += -O2
>>
>
>
> I still do not think that -O2 belongs here.
> it should simply be removed.

True it should, but all i did was change the EXTRA_CFLAGS to ccflags-y.

>
> re,
>  wh
>
>
>
>> -EXTRA_CFLAGS += -DJACKSON_NEW_RX
>> -EXTRA_CFLAGS += -DTHOMAS_BEACON
>> +ccflags-y += -DJACKSON_NEW_RX
>> +ccflags-y += -DTHOMAS_BEACON
>>
>> -#EXTRA_CFLAGS += -DMUTIPLE_BULK_OUT
>> +#ccflags-y += -DMUTIPLE_BULK_OUT
>>
>>  r8192s_usb-objs :=		\
>>  	r8192U_wx.o		\
>


            TD
