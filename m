From: walter harms <wharms@bfs.de>
Date: Mon, 20 Dec 2004 09:32:28 +0000
Subject: Re: [KJ] janitor project: fix warnings
Message-Id: <41C69C2C.5060506@bfs.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============78710759557463483=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============78710759557463483==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit


mmmh,
i have no problem to test other ppl software and fixing warnings is a 
good thing.
does this mean we will have a linux kernel compiling without warnings in 
future ? We should define this as a target. i had no reply for my last 
patches in that sense and assumed they were to unimportant.

re,
walter

ps: is it ok to ask/discuss problems with e.g. binutils on the list ?
i had some problems with ld on alpha  (crashes compiling linux kernel 
because of GOT problems). the maintainer was not happy as i told him to 
recompile the linux kernel :( but if found no other way to reproduce the 
error.



Andi Kleen wrote:
> On Mon, Dec 20, 2004 at 12:15:39AM +0200, Alexey Dobriyan wrote:
> 
>>On Sunday 19 December 2004 21:09, Andi Kleen wrote:
>>
>>
>>>make allmodconfig
>>>make CC=/usr/local/gcc4/bin/gcc 2>&1 | tee LOG
>>
>>  CC      kernel/acct.o
>>kernel/acct.c: In function ???encode_float???:
>>kernel/acct.c:366: fatal error: internal consistency failure
>>compilation terminated.
> 
> 
> I checked this and it doesn't seem to happen with my compiler
> (which is a newer CVS checkout). So I assume it has been fixed already.
> 
> -Andi
> 
> 
> ------------------------------------------------------------------------
> 
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============78710759557463483==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============78710759557463483==--
