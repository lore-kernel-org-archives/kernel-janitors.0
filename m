From: Gustavo Franco <stratus@acm.org>
Date: Tue, 25 May 2004 00:47:12 +0000
Subject: Re: [Kernel-janitors] Re: Replaces yield() with nicedelay() on
Message-Id: <40B29790.7010402@acm.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============5332359668587856=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040524132440.GA23599@nd47>
In-Reply-To: <20040524132440.GA23599@nd47>
To: kernel-janitors@vger.kernel.org

--===============5332359668587856==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Greg KH wrote:
> On Mon, May 24, 2004 at 03:24:40PM +0200, Domen Puncer wrote:
> 
>>On 02/05/04 22:24 -0300, Gustavo Franco wrote:
>>
>>>Hi,
>>>
>>>It's the last REDIFF, but i'm not replacing yield() with 
>>>schedule_timeout() because there's a nicedelay() (maybe the
>>>usecs need to be tuned below) there:
>>>
>>>
>>>static inline void nicedelay(unsigned long usecs)
>>>{
>>>        current->state = TASK_INTERRUPTIBLE;
>>>        schedule_timeout(HZ);
>>>        return;
>>>}
>>
>>And usecs stands for??
>>Funny thing is that there are actualy uses of this function.

Yes, it's not my piece of code.

> Heh, also look at using the msleep function instead of redefining your
> own function.
> 

Are you recommending to use msleep() instead schedule_timeout() to 
replace yield() ? Only in some cases? What?


Thanks,
Gustavo Franco

--===============5332359668587856==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============5332359668587856==--
