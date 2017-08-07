From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 07 Aug 2017 18:34:02 +0000
Subject: Re: block/ps3vram: Delete an error message for a failed memory allocation in ps3vram_cache_init()
Message-Id: <32cdcd8a-1000-223c-71da-4c9119954d4e@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e22ee16a-5f34-46bd-577f-9b7ca75e9035@users.sourceforge.net>
 <b6b5f2f0-bbfe-8471-d8fc-e236ea0b1ea4@infradead.org>
 <dd16f28c-1613-cfb2-5349-07aaac2f2f5a@users.sourceforge.net>
 <8d140d00-935c-da0a-ff2e-167abe642bda@infradead.org>
In-Reply-To: <8d140d00-935c-da0a-ff2e-167abe642bda@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Geoff Levand <geoff@infradead.org>, linuxppc-dev@lists.ozlabs.org
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>> Do you find the default allocation failure report insufficient?
> 
> The default is OK.

Thanks for this information.


> I didn't consider one would be triggered by the kzalloc failure.

Do you reconsider any special system settings for further
software evolution then?

Regards,
Markus
