From: Marcus Wolf <marcus.wolf@wolf-entwicklungen.de>
Date: Wed, 19 Jul 2017 17:45:26 +0000
Subject: Re: [PATCH] staging: pi433: fix a precedence bug
Message-Id: <965068167.81962.1500486327379@ox.hosteurope.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170719095157.3e2rnskjqbva2kwo@mwanda>
In-Reply-To: <20170719095157.3e2rnskjqbva2kwo@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Once again in plain text, only - sorry for frogetting to set the switch in my
mailtool....
 
Hi Dan, Hi Walter,
 
thank you for your investigation.
 
rf69_get_modulation, rf69_get_lna_gain, rf69_set_lna_gain: Seems like I messed
up a few things :-/
 
In the beginning, the defines were left-bound "real"  values, like you can see
for the LNA_GAIN values. Later on, I deceided not to use left-bound "real"
values, but to leave the bits at the position, they have in the register. These
two impelemtation types are mixed up here. Sorry.
 
Result: The shift is obsolete and the LNA_GAIN defines are old-style and need to
be reviesed. I will send a patch with a proposal in approx. half an hour.
 
rf69_set_deviation: Yes Dan, bitwise negate was intended.
 
Once again, thanks a lot for your investigation,
 
Marcus
 
 
Thanks a lot,
 
Marcus
 

> Dan Carpenter <dan.carpenter@oracle.com> hat am 19. Juli 2017 um 12:26
> geschrieben:
>
>
> Actually, please drop this patch. I looked at this one the same as I
> did the other one, but I didn't look closely enough. It's the same
> situation where we have two bugs that probably cancel each other out
> somewhat. It maybe needs to be fixed by someone who can test the code.
>
> In rf69_set_lna_gain() we should be left shifting << 3 but we don't.
>
> regards,
> dan carpenter
>
>
