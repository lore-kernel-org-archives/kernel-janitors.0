From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 25 Sep 2016 12:47:06 +0000
Subject: Re: [PATCH 5/5] ISDN-CAPI: Delete unnecessary braces
Message-Id: <727b14d4-7a3b-9de8-25d9-c3bf212f7c44@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <be07f84d-fc84-e47d-207e-aedd8c960151@users.sourceforge.net>
 <06e7637c-f682-bfa2-82b6-47d071bd58c4@users.sourceforge.net>
 <52dd5000-2bda-a1b6-aa97-1868e1193d35@cogentembedded.com>
In-Reply-To: <52dd5000-2bda-a1b6-aa97-1868e1193d35@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: netdev@vger.kernel.org, Karsten Keil <isdn@linux-pingi.de>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

>> @@ -976,13 +974,12 @@ static void handle_controller(_cmsg *cmsg)
>>          if (debugmode)
>>              printk(KERN_DEBUG "capidrv-%d: listenconf Info=0x%4x (%s) cipmask=0x%x\n",
>>                     card->contrnr, cmsg->Info, capi_info2str(cmsg->Info), card->cipmask);
>> -        if (cmsg->Info) {
>> +        if (cmsg->Info)
>>              listen_change_state(card, EV_LISTEN_CONF_ERROR);
>> -        } else if (card->cipmask = 0) {
>> +        else if (card->cipmask = 0)
>>              listen_change_state(card, EV_LISTEN_CONF_EMPTY);
>> -        } else {
>> +             else
> 
>    Indented too much.

How do you think about an alignment of this "else"
with the corresponding if statement three lines above?

Regards,
Markus
