From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 04 Jan 2016 12:33:17 +0000
Subject: Re: rsi: Delete unnecessary variable initialisations in rsi_send_mgmt_pkt()
Message-Id: <568A668D.8090007@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <5687E169.4070704@users.sourceforge.net>
 <5687E203.1070404@users.sourceforge.net> <20160104092857.GD5284@mwanda>
 <568A4CFF.8060600@users.sourceforge.net> <20160104114849.GH5284@mwanda>
In-Reply-To: <20160104114849.GH5284@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, Kalle Valo <kvalo@codeaurora.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

>> May I resend a consistent patch series for the source file
>> "drivers/net/wireless/rsi/rsi_91x_pkt.c" in the near future?
> 
> If you were sending checkpatch.pl fixes that would be easier to deal with

Does this feedback mean that you would accept any more suggestions around
source code updates which are derived from recommendations of this script?


> but you are sending hundreds of "controversial" cleanups.

It depends on the time range you look at for my proposals.


> They are controversial in the sense that they don't fix anything
> against official kernel style

I find that I suggested also few changes that fit to this aspect.


> and they go against the author's original intention.

Can it occasionally help to reconsider the "first approach"?


> I tend to agree that useless initializers are bad

Would any more software developers like to share their opinions on this detail?


> and disable GCCs uninitialized variable warnings

I hope that this software area can be also improved.


> but just because I agree with you doesn't make it official kernel style.

That is fine. - Will it become useful to clarify any extensions
to a document like "CodingStyle"?


> It's slightly rude to go against the author's intention.

I just dare to propose further special changes.

Regards,
Markus

