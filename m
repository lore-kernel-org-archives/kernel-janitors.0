From: Devin Heitmueller <dheitmueller@kernellabs.com>
Date: Mon, 25 Jan 2016 18:38:17 +0000
Subject: Re: [PATCH] [media] xc5000: Faster result reporting in xc_load_fw_and_init_tuner()
Message-Id: <CAGoCfix7eRYMiFRaoWn03rEt1bdQYz5YtaFyxLUAs=WZ9q9jwQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
	<56818B7B.8040801@users.sourceforge.net>
	<20160125150654.7ada12ac@recife.lan>
	<56A6680B.9050200@users.sourceforge.net>
In-Reply-To: <56A6680B.9050200@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Linux Media Mailing List <linux-media@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

> Are you interested in a bit of software optimisation for the implementation
> of the function "xc_load_fw_and_init_tuner"?

To be clear, absolutely none of the code in question is performance
sensitive (i.e. saving a couple of extra CPU cycles has no value in
this case).  Hence given that I'm assuming you have no intention to
actually test any of these patches with a real device I would
recommend you do the bare minimum to prevent Coccinelle from
complaining and not restructure any of the core business logic unless
you plan to also do actual testing.

Thanks,

Devin

-- 
Devin J. Heitmueller - Kernel Labs
http://www.kernellabs.com
