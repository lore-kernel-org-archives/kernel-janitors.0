From: Arnaldo Carvalho de Melo <acme@conectiva.com.br>
Date: Thu, 17 Jun 2004 05:24:09 +0000
Subject: Re: [Kernel-janitors] please comment on this patch
Message-Id: <40D12AF9.3010101@conectiva.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============30050534492785363=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200406160257.i5G2vWLJ023048@sirius.cs.pdx.edu>
In-Reply-To: <200406160257.i5G2vWLJ023048@sirius.cs.pdx.edu>
To: kernel-janitors@vger.kernel.org

--===============30050534492785363==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Kristen Carlson wrote:
>>On Tue, Jun 15, 2004 at 07:57:32PM -0700, Kristen Carlson wrote:
>>
>>>For removing check_region from drivers/char/esp.c
>>
>>Better than most first attempts, but some problems.  Mostly inherent in the
>>original driver ;-)
> 
> 
> 
> Agreed, the driver is not written in the clearest way it could have been .  
> This actually brings me to ask a philosophical clarification for janitor work.

:-) IMHO there are lots of ways people see what being a "kernel janitor" 
  really means... I think the best definition is: to have taste.

I.e. stick to the APIs, follow the "de facto" mostly undocumented "style 
of the ``good chunks'' of the kernel sources", i.e. look at how Al Viro 
writes code, read his reasonings on the linux-kernel mailing list, 
follow it, that is to be a janitor, in my humble opinion.

> In general, should we stick with our appointed task (i.e. do as little as 
> possible to the driver except what the instructions in the TODO list specify), 
> or is it acceptable to do more extensive changes?  AND, without hardware to 
> test with, how much changes should you really do to a driver?  For example, 
> I don't know if I'd feel comfortable re-writing too much of this driver 
> without being able to test it.

1. if the code is good, there is no need to touch it

2. if the code works, but is ugly, do changes that make it more 
understandable and closer to what is considered good taste

3. if the code doesn't works, fix it, taking advantage that you're 
_studying_ it to understand what is to be fixed and see if it follow the 
magical definition of "good taste" and send some preparatory patches
cleaning it. Then fix it.

Sometimes, just suggest ditching it from the kernel sources, I'm sure 
many here remember some cases where there was no hope for salvation :-)

- Arnaldo

--===============30050534492785363==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============30050534492785363==--
