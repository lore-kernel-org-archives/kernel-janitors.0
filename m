From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 28 Dec 2015 10:30:46 +0000
Subject: Re: [media] tuners: One check less in m88rs6000t_get_rf_strength() after error detection
Message-Id: <56810F56.4080306@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <5680FDB3.7060305@users.sourceforge.net>
 <alpine.DEB.2.10.1512281019050.2702@hadrien>
In-Reply-To: <alpine.DEB.2.10.1512281019050.2702@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>> Move the jump label directly before the desired log statement
>> so that the variable "ret" will not be checked once more
>> after it was determined that a function call failed.
> 
> Why not avoid both unnecessary ifs

I would find such a fine-tuning also nice in principle at more source code places.


> and the enormous ugliness of a label inside an if by making two returns:
> a return 0 for success and a dev_dbg and return ret for failure?

How should your suggestion finally work when the desired execution success
can be determined for such functions only after several other calls succeeded?

Is consistent checking of failure predicates usually required?

Regards,
Markus
