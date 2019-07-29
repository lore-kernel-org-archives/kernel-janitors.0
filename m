From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Date: Mon, 29 Jul 2019 11:50:40 +0000
Subject: Re: [PATCH][next] drivers: thermal: processor_thermal_device: fix missing bitwise-or operator
Message-Id: <6be021a31eb9a7976b2347dd3ac3cd7f10c8d71f.camel@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190729102930.2956-1-colin.king@canonical.com>
         <5D3ED780.7010407@bfs.de>
         <0cfe48bb-d97f-86d3-db4b-fdd864197b69@canonical.com>
In-Reply-To: <0cfe48bb-d97f-86d3-db4b-fdd864197b69@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin Ian King <colin.king@canonical.com>, wharms@bfs.de
Cc: Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 2019-07-29 at 12:29 +0100, Colin Ian King wrote:
> On 29/07/2019 12:24, walter harms wrote:
> > 
> > 
> > Am 29.07.2019 12:29, schrieb Colin King:
> > > From: Colin Ian King <colin.king@canonical.com>
> > > 
> > > The variable val is having the top 8 bits cleared and then the
> > > variable
> > > is being re-assinged and setting just the top 8 bits.  I believe
> > > the
> > > intention was bitwise-or in the top 8 bits.  Fix this by
> > > replacing
> > > the = operator with |= instead.
> > > 
> > > Addresses-Coverity: ("Unused value")
> > > Fixes: b0c74b08517e ("drivers: thermal: processor_thermal_device:
> > > Export sysfs inteface for TCC offset")
> > > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > > ---
> > >  .../thermal/intel/int340x_thermal/processor_thermal_device.c    
> > > | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git
> > > a/drivers/thermal/intel/int340x_thermal/processor_thermal_device.
> > > c
> > > b/drivers/thermal/intel/int340x_thermal/processor_thermal_device.
> > > c
> > > index 6f6ac6a8e82d..cb22317911ef 100644
> > > ---
> > > a/drivers/thermal/intel/int340x_thermal/processor_thermal_device.
> > > c
> > > +++
> > > b/drivers/thermal/intel/int340x_thermal/processor_thermal_device.
> > > c
> > > @@ -164,7 +164,7 @@ static int tcc_offset_update(int tcc)
> > >  		return err;
> > >  
> > >  	val = ~GENMASK_ULL(31, 24);
> > > -	val = (tcc & 0xff) << 24;
> > > +	val |= (tcc & 0xff) << 24;
> > >  
> > 
> > I do not think that GENMASK makes sence here.
> 
> Yeah, val &= ~GENMASK_ULL(31, 24)
> 
> I'll send a V2
> 
Thanks Colin for the fix.

-Srinivas
> 
> > 
> > re,
> >  wh
> > 
> > >  	err = wrmsrl_safe(MSR_IA32_TEMPERATURE_TARGET, val);
> > >  	if (err)
> 
> 
