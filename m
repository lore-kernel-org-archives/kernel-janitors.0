From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Wed, 12 Dec 2007 01:40:56 +0000
Subject: Re: [PATCH 1/6] pcmcia/3c574_cs: Fix dubious bitfield warning
Message-Id: <475F3C28.7010409@student.ltu.se>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------060808040403080803070107"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20071211043412.28518.40867.sendpatchset@thinktank.campus.ltu.se> <20071211131936.3379f2af@the-village.bc.nu>
In-Reply-To: <20071211131936.3379f2af@the-village.bc.nu>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-pcmcia@lists.infradead.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

This is a multi-part message in MIME format.
--------------060808040403080803070107
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Alan Cox wrote:
> On Tue, 11 Dec 2007 05:32:38 +0100 (MET)
> Richard Knutsson <ricknu-0@student.ltu.se> wrote:
>
>   
>> Fixing:
>>   CHECK   drivers/net/pcmcia/3c574_cs.c
>> drivers/net/pcmcia/3c574_cs.c:194:13: warning: dubious bitfield without explicit `signed' or `unsigned'
>> drivers/net/pcmcia/3c574_cs.c:196:14: warning: dubious bitfield without explicit `signed' or `unsigned'
>>
>> Signed-off-by: Richard Knutsson <ricknu-0@student.ltu.se>
>> ---
>> Is there a reason for not doing it this way?
>>     
>
> How is the endianness handled here (I suspect its always been broken)
>   
Guess so, but it should not handle the endians differently with such a 
change, does it?
>   
>> diff --git a/drivers/net/pcmcia/3c574_cs.c b/drivers/net/pcmcia/3c574_cs.c
>> index ad134a6..97b6daa 100644
>> --- a/drivers/net/pcmcia/3c574_cs.c
>> +++ b/drivers/net/pcmcia/3c574_cs.c
>> @@ -190,10 +190,10 @@ enum Window3 {			/* Window 3: MAC/config bits. */
>>  union wn3_config {
>>  	int i;
>>  	struct w3_config_fields {
>> -		unsigned int ram_size:3, ram_width:1, ram_speed:2, rom_size:2;
>> -		int pad8:8;
>> -		unsigned int ram_split:2, pad18:2, xcvr:3, pad21:1, autoselect:1;
>> -		int pad24:7;
>> +		u8 ram_size:3, ram_width:1, ram_speed:2, rom_size:2;
>> +		u8 pad8;
>> +		u8 ram_split:2, pad18:2, xcvr:3, pad21:1;
>> +		u8 autoselect:1, pad24:7;
>>     
>
> Just changing the int pad to unsigned int pad would be safer in terms of
> not causing changes. Simply delcaring a 32bit field and bit masks to
> and/or into it is probably a lot saner in the general case.
>   
Thought about it before and with the endian-issue it seem like a better 
solution.
So, something like this?


--------------060808040403080803070107
Content-Type: text/x-patch;
 name="drivers_net_pcmcia_3c574_cs.c-dubious-bitfield.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename*0="drivers_net_pcmcia_3c574_cs.c-dubious-bitfield.patch"

Fixing:
  CHECK   drivers/net/pcmcia/3c574_cs.c
drivers/net/pcmcia/3c574_cs.c:194:13: warning: dubious bitfield without explicit `signed' or `unsigned'
drivers/net/pcmcia/3c574_cs.c:196:14: warning: dubious bitfield without explicit `signed' or `unsigned'

Signed-off-by: Richard Knutsson <ricknu-0@student.ltu.se>
---
Moved 'autoselect' to the last line to make every line 8 bits.
Is there a reason for not doing it this way?


diff --git a/drivers/net/pcmcia/3c574_cs.c b/drivers/net/pcmcia/3c574_cs.c
index ad134a6..e549427 100644
--- a/drivers/net/pcmcia/3c574_cs.c
+++ b/drivers/net/pcmcia/3c574_cs.c
@@ -190,10 +190,10 @@ enum Window3 {			/* Window 3: MAC/config bits. */
 union wn3_config {
 	int i;
 	struct w3_config_fields {
-		unsigned int ram_size:3, ram_width:1, ram_speed:2, rom_size:2;
-		int pad8:8;
-		unsigned int ram_split:2, pad18:2, xcvr:3, pad21:1, autoselect:1;
-		int pad24:7;
+		u32 ram_size:3, ram_width:1, ram_speed:2, rom_size:2,
+		    pad8:8,
+		    ram_split:2, pad18:2, xcvr:3, pad21:1,
+		    autoselect:1, pad24:7;
 	} u;
 };
 

--------------060808040403080803070107--
