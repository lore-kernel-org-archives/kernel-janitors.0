From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Date: Sat, 07 Nov 2015 00:41:10 +0000
Subject: Re: [PATCH] CPPC-CPUFreq: Delete an unnecessary check before the function call "kfree"
Message-Id: <2429041.ODHvPqId6J@vostro.rjw.lan>
List-Id: <kernel-janitors.vger.kernel.org>
References: <530C5E18.1020800@users.sourceforge.net> <563BB8DF.7020908@users.sourceforge.net> <20151106014228.GD3773@ubuntu>
In-Reply-To: <20151106014228.GD3773@ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, linux-pm@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Friday, November 06, 2015 07:12:28 AM Viresh Kumar wrote:
> On 05-11-15, 21:15, SF Markus Elfring wrote:
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Thu, 5 Nov 2015 21:10:29 +0100
> > 
> > The kfree() function tests whether its argument is NULL and then
> > returns immediately. Thus the test around the call is not needed.
> > 
> > This issue was detected by using the Coccinelle software.
> > 
> > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> > ---
> >  drivers/cpufreq/cppc_cpufreq.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

Applied, thanks!

Rafael

