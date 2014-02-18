From: Michal Simek <michal.simek@xilinx.com>
Date: Tue, 18 Feb 2014 12:33:30 +0000
Subject: Re: regmap: Separate regmap dev initialization
Message-Id: <0e1df580-5e86-4f17-8be9-91226a5b5273@CH1EHSMHS016.ehs.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140218122410.GA9825@elgon.mountain>
In-Reply-To: <20140218122410.GA9825@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Dan,

On 02/18/2014 01:24 PM, Dan Carpenter wrote:
> Hello Michal Simek,
> 
> The patch 6cfec04bcc05: "regmap: Separate regmap dev initialization"
> from Feb 10, 2014, leads to the following static checker warning:
> 
> 	drivers/base/regmap/regmap.c:765 regmap_init()
> 	warn: add curly braces?
> 
> drivers/base/regmap/regmap.c
>    759          ret = regcache_init(map, config);
>    760          if (ret != 0)
>    761                  goto err_range;
>    762  
>    763          if (dev)
>    764                  ret = regmap_attach_dev(dev, map, config);
>    765                  if (ret != 0)
>    766                          goto err_regcache;
> 
> Please add curly braces or adjust the indenting to not confuse the
> static checkers.

I am aware about this. Mark has already applied RFC to any his branch
:-(. I can send v2 but it is up to Mark if he wants to fix it or not.

Thanks,
Michal


