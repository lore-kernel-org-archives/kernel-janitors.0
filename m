From: Gustavo Franco <stratus@acm.org>
Date: Sun, 25 Apr 2004 22:13:53 +0000
Subject: Re: [Kernel-janitors] [PATCH] - Replaces yield() with
Message-Id: <408C3821.505@acm.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============19367001522049998=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <407C9AEE.5020808@legolas.alternex.com.br>
In-Reply-To: <407C9AEE.5020808@legolas.alternex.com.br>
To: kernel-janitors@vger.kernel.org

--===============19367001522049998==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Domen Puncer wrote:

>...
>  
>
>>| >| --- drivers/cdrom/cdu31a.c.orig 2004-04-13 22:43:55.000000000 -0300
>>| >| +++ drivers/cdrom/cdu31a.c      2004-04-13 22:44:17.000000000 -0300
>>| >| @@ -386,7 +386,7 @@ static inline void sony_sleep(void)
>>| >|         unsigned long flags;
>>| >|                                                                                          
>>| >| 
>>| >|         if (cdu31a_irq <= 0) {
>>| >| -               yield();
>>| >| +               schedule_timeout(1);
>>    
>>
>
>set_current_state() missing.
>
>
>	Domen
>
>  
>
Domen,

Are you talking about something like:
<http://www.iglu.org.il/lxr/ident?i=set_current_state>
set_current_state(TASK_UNINTERRUPTIBLE);
schedule_timeout(1);

Is is really necessary?

Thanks,
Gustavo Franco -- <stratus@acm.org>

--===============19367001522049998==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============19367001522049998==--
