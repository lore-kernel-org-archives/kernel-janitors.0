From: Zhang Rui <rui.zhang@intel.com>
Date: Wed, 01 Aug 2012 08:54:26 +0000
Subject: Re: [thermal:thermal 5/13] drivers/power/power_supply_core.c:204:6: error: too many arguments to fun
Message-Id: <1343811266.1682.496.camel@rui.sh.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120801073612.GA11970@localhost>
In-Reply-To: <20120801073612.GA11970@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

On 三, 2012-08-01 at 16:35 +0800, Zhang Rui wrote:
> in this case, should I create an incremental patch to fix the problem,
> or should I refresh my patch to cover that?
> 
I refreshed the patch to fix the build error. please pull.

thanks,
rui

> 三, 2012-08-01 at 15:36 +0800, Fengguang Wu wrote:
> > Hi Zhang,
> > 
> > Kernel build failed on
> > 
> > tree:   git://git.kernel.org/pub/scm/linux/kernel/git/rzhang/linux.git thermal
> > head:   77fd40968a98055d5e910461be9a8c7a8be63251
> > commit: 230c4d13a49b0faed79f1273d0f43121fa993ff5 [5/13] Thermal: Remove tc1/tc2 in generic thermal layer.
> > config: x86_64-randconfig-h021 (attached as .config)
> > 
> > All related error/warning messages:
> > 
> > drivers/power/power_supply_core.c: In function 'psy_register_thermal':
> > drivers/power/power_supply_core.c:204:6: error: too many arguments to function 'thermal_zone_device_register'
> > In file included from drivers/power/power_supply_core.c:20:0:
> > include/linux/thermal.h:163:29: note: declared here
> > 
> > vim +204 drivers/power/power_supply_core.c
> >    201		for (i = 0; i < psy->num_properties; i++) {
> >    202			if (psy->properties[i] = POWER_SUPPLY_PROP_TEMP) {
> >    203				psy->tzd = thermal_zone_device_register(psy->name, 0, 0,
> >  > 204						psy, &psy_tzd_ops, 0, 0, 0, 0);
> >    205				if (IS_ERR(psy->tzd))
> >    206					return PTR_ERR(psy->tzd);
> >    207				break;
> > 
> > ---
> > 0-DAY kernel build testing backend         Open Source Technology Centre
> > Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
> 


