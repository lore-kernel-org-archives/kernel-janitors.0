From: Gustavo Franco <stratus@acm.org>
Date: Tue, 25 May 2004 00:49:28 +0000
Subject: [Kernel-janitors] Re: Replaces yield() with nicedelay() on
Message-Id: <40B29818.6070806@acm.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============47835014094865125=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040524132440.GA23599@nd47>
In-Reply-To: <20040524132440.GA23599@nd47>
To: kernel-janitors@vger.kernel.org

--===============47835014094865125==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Domen Puncer wrote:
> On 02/05/04 22:24 -0300, Gustavo Franco wrote:
> 
>>Hi,
>>
>>It's the last REDIFF, but i'm not replacing yield() with 
>>schedule_timeout() because there's a nicedelay() (maybe the
>>usecs need to be tuned below) there:
>>
>>
>>static inline void nicedelay(unsigned long usecs)
>>{
>>        current->state = TASK_INTERRUPTIBLE;
>>        schedule_timeout(HZ);
>>        return;
>>}
> 
> 
> And usecs stands for??
> Funny thing is that there are actualy uses of this function.

What do you think about msleep() as greg said?

> Also, please make -p1 applyable patches.

I'm preparing my travel to debconf4, i'll be back on 30 May.In
early June i'll send rediffied patches.As i said in a previous
post it was my error.I was still considering the "old" SubmittingPatches.


Thanks,
Gustavo Franco

--===============47835014094865125==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============47835014094865125==--
