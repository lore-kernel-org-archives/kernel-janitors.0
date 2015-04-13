From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 13 Apr 2015 10:16:23 +0000
Subject: Re: [patch 2/2 v2] leds: netxbig: silence a static checker warning
Message-Id: <20150413101623.GL16501@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150410083040.GA2189@mwanda>
 <5527DBBA.9060109@samsung.com>
 <20150410143056.GI16501@mwanda>
 <20150410144123.GI1509@kw.sim.vm.gnt>
 <20150410155034.GK16501@mwanda>
 <20150410195224.GJ1509@kw.sim.vm.gnt>
In-Reply-To: <20150410195224.GJ1509@kw.sim.vm.gnt>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Simon Guinot <simon.guinot@sequanux.org>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, kernel-janitors@vger.kernel.org

The subject of this patch is "silence a static checker warning."  I'm
just not going to send patches to deliberately introduce static checker
warnings.  :P  Forget about it.

This is like those patches that Markus Elfring sent removing if
conditions.  It seems like it should make the code shorter an more
simple to remove code but it actually makes the code more subtle and
difficult to understand.

regards,
dan carpenter

