From: "Scott Thompson" <postfail@hushmail.com>
Date: Wed, 01 Aug 2007 13:25:51 +0000
Subject: Re: [PATCH 2/3] sound/pci ioremap/iounmap balancing
Message-Id: <20070801132551.5A8132281F@mailserver9.hushmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070801060256.F0BA2DA820@mailserver8.hushmail.com>
In-Reply-To: <20070801060256.F0BA2DA820@mailserver8.hushmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: tiwai@suse.de
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org



On Wed, 01 Aug 2007 06:38:16 -0400 Takashi Iwai <tiwai@suse.de> 
wrote:
>This would be rater a lacking check of returned errors.
>
>The other changes look incorrect.  All these drivers use
>card->private_free callback to release the resources even for the
>error exit.  Thus, you don't need iounmap in each place.
>
>
>thanks,
>
>Takashi


Missed the callback on the audit, will repost this patch 
(sound/pci) with just the unchecked returns...

---------------------------------------
Scott Thompson / postfail@hushmail.com
---------------------------------------

--
Click for free info on online masters degrees and make up to $150K/ year
http://tagline.hushmail.com/fc/Ioyw6h4eS92xMNMCt3tx2zrkeCY7ERKxlEfaEq8mHdh5eNBoZjv0z8/

