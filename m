From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sun, 22 Jan 2012 06:09:36 +0000
Subject: Re: busy loops in kernel
Message-Id: <alpine.DEB.2.02.1201220702240.2189@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAFTXME+fNAqqZjO4oRmbwt2cFbaDgbLW9gg94tzJvF4bwy7DtQ@mail.gmail.com>
In-Reply-To: <CAFTXME+fNAqqZjO4oRmbwt2cFbaDgbLW9gg94tzJvF4bwy7DtQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



On Sat, 21 Jan 2012, Asim wrote:

> Yeah - these are not the strongest parts of the analyses. Lately, as
> we have added more busses, interprocedural analyses and supported
> newer kernels, we've seen more problems. In the first example, CIL(our
> underlying analysis language) cannot distinguish between for and while
> loops. To distinguish for loops and to eliminate certain class of
> timers, we try to detect for loops and counters by searching for
> integers that increment/decrement by 1. Here, it increments by 25, and
> it is not caught as a for loop. Then, the intermediate code generated
> for this is :
>
> #line 185
>    tmp___7 = readl((void const volatile   *)(mem + i));
> #line 185
>    if (tmp___7 = 305419896U) {
> #line 185
>      tmp___8 = readl((void const volatile   *)((mem + i) + 4));
> #line 185
>      if (tmp___8 = 878082066U) {
> #line 185
>        tmp___9 = readl((void const volatile   *)((mem + i) + 8));
> #line 185
>        if (tmp___9 = 1450709556U) {
> #line 185
>          tmp___10 = readl((void const volatile   *)((mem + i) + 12));
> #line 185
>          if (tmp___10 = 2014458966U) {
> #line 189
>            return ((struct ivtv_mailbox  volatile  *)((mem + i) + 16));
>          }
>
>
> Here it detects, that the exit condition is dependent on a read from
> device, and marks this loop as a suspect.

There exists an exit condition that has this property, but isn't there 
only a problem if this is the only exit condition?  Or is the code 
obfuscated by CIL such that the normal exit cannot be detected?

> Apart from random
> increments, we also face problems with casts used while detecting loop
> exit conditions/for loops. Second one is a bug in how i2c_transfer
> function is handled (i2c bus was added sometime this year). I've fixed
> it and will update results shorty...
>
> As I mentioned in my previous email, I would perhaps give priority to
> the simpler examples that are plenty..

Are they ordered by increasing complexity?  I didn't start at the top.  In 
any case the false positive rate seems to be much higher than 5%.  So you 
might get better results by removing the false positives first.  Also, you 
might want to send the reports to the specific maintainers (you can use 
get_maintainer.pl to get a list for each file).  I'm not sure that the 
people who read the kernel janitors list would have the expertise to both 
be sure that there is a real problem and choose the desired solution.  But 
if there is a real problem, the maintainer will probably react quickly.

julia
