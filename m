From: Andi Kleen <ak@muc.de>
Date: Mon, 20 Dec 2004 07:10:49 +0000
Subject: Re: [KJ] janitor project: fix gcc 4 warnings
Message-Id: <20041220071049.GA30448@muc.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============4431395091090562=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041219190903.GA30192@muc.de>
In-Reply-To: <20041219190903.GA30192@muc.de>
To: kernel-janitors@vger.kernel.org

--===============4431395091090562==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 20, 2004 at 12:15:39AM +0200, Alexey Dobriyan wrote:
> On Sunday 19 December 2004 21:09, Andi Kleen wrote:
> 
> > make allmodconfig
> > make CC=/usr/local/gcc4/bin/gcc 2>&1 | tee LOG
> 
>   CC      kernel/acct.o
> kernel/acct.c: In function ???encode_float???:
> kernel/acct.c:366: fatal error: internal consistency failure
> compilation terminated.

Looks like another gcc bug. I will file a gcc bug thanks. 

Just disable accounting in the .config to continue or use make -k 


> 
> here.
> 
> Maaaany "differ in signedness" warnings.

Yep, and some new "bla is uninitialized" warnings. Many of them 
are bogus, because gcc just cannot prove if a variable is 
uninitialized or not and it now does it for structure fields
too. Anyways, they all need to be examined and fixed.

> ===============================================================================
> init/main.c: In function ???maxcpus???:
> init/main.c:150: warning: pointer targets in passing argument 2 of ???get_option??? 
> differ in signedness
> ===============================================================================
> unsigned int maxcpus;
> int get_option(char **str, int *pint);
> ...
> get_option(&str, &max_cpus);
> ===============================================================================
> For example, this one should be left as is, shouldn't it?


The warning should be fixed, otherwise the warning noise will
hide real valuable warnings. It's a judgement call whether you
modify the function prototype or the argument. In this case
both would be possible. I would usually do the change that
requires less work (e.g. fix the argument in this case because
there are a lot more get_option callers). This means make maxcpus
an int. Please avoid adding casts if possible. 

-Andi


--===============4431395091090562==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============4431395091090562==--
