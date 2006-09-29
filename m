From: Hashem Masoud <masoudh@batelco.com.bh>
Date: Fri, 29 Sep 2006 13:02:36 +0000
Subject: Re: [KJ] [PATCH] check return code for request_region() in
Message-Id: <451D196C.5010301@batelco.com.bh>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060928103514.GA12240@localhost.localdomain>
In-Reply-To: <20060928103514.GA12240@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Jesper Juhl wrote:

>> +++ linux/sound/oss/gus_wave.c  2006-09-28 20:17:41.093694160 -0300
>> @@ -2938,7 +2938,10 @@ void __init gus_wave_init(struct address
>>                         model_num = "3.7";
>>                         gus_type = 0x37;
>>                         mixer_type = ICS2101;
>> -                       request_region(u_MixSelect, 1, "GUS mixer");
>> +                       if !(request_region(u_MixSelect, 1, "GUS 
>> mixer")) {
> 
> 
> ... and it shows ^^^^^

BTW, Google web mail access automatically translates tabs into spaces, but if you download your e-mails using POP access this won't happen.
Also, check the patch posted to list, it is intact: http://lists.osdl.org/pipermail/kernel-janitors/2006-September/007352.html

> 
> Please take the time to do minimal testing. Not doing so is a waste of
> a lot of peoples time.
> 
> 

Thanks. I Tested the 2 previous patches through make allmodconfig and make sound/oss/ .


-- 
Hashem Masoud
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
