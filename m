From: Julia Lawall <julia.lawall@lip6.fr>
Date: Mon, 10 Dec 2012 06:10:16 +0000
Subject: Re: [PATCH 3/3] sound/soc/soc-core.c: drop kfree of devm_kzalloc's data
Message-Id: <alpine.DEB.2.02.1212100709450.2213@localhost6.localdomain6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1354989680-25794-1-git-send-email-Julia.Lawall@lip6.fr>
 <20121210052334.GI10927@opensource.wolfsonmicro.com>
In-Reply-To: <20121210052334.GI10927@opensource.wolfsonmicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Julia Lawall <Julia.Lawall@lip6.fr>, matthias@kaehlcke.net, Liam Girdwood <lrg@ti.com>

On Mon, 10 Dec 2012, Mark Brown wrote:

> On Sat, Dec 08, 2012 at 07:01:20PM +0100, Julia Lawall wrote:
>
>> The kfrees were introduced in b761c0ca.
>> I sent this a few months ago, and I still think it should be applied...
>
> I'm missing patches 1 and 2?

Sorry, I just resent the patch as is.  1 and 2 were I guess applied, 
because I odn't findthe problem any more.

julia
