From: Marcin Slusarz <marcin.slusarz@gmail.com>
Date: Sun, 04 Dec 2005 10:55:57 +0000
Subject: Re: [KJ] [PATCH 20/21] polling loops: change exit condition to
Message-Id: <4392CB3D.205@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <43923735.4060604@gmail.com>
In-Reply-To: <43923735.4060604@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Roland Dreier wrote:
> The end_time has to be computed before the loop starts and then not
> change again.
> 
> With that said I'm not sure that these patches are a good idea.  For
> example, what if in the code below:
> 
> 
>>        /* Wait max 1 Sec for data download and processor to start */
>>-       for (index = 0; index < 10; index++) {
>>+       end_time = jiffies + msecs_to_jiffies(1000);
> 
> 
> this gets preempted for a while and never even enters the loop below:
> 
> 
>>+       while (time_before(jiffies, end_time)) {
>>                msleep(100);
> 
> 
> then the function will fail without even checking the hardware once.

ok, so maybe while loops should be changed to do while loops?

ps: does anyone know why i don't get my own emails? (i checked subscription
page and everything is fine there)

regards,
Marcin
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
