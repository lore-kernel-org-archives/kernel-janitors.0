From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 29 Sep 2019 18:18:00 +0000
Subject: Re: [Cocci] [RFC] scripts: Fix coccicheck failed
Message-Id: <91b84fbf-0be8-85a2-616e-d3c463987cb8@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.21.1909291810300.3346@hadrien>
 <90cea5d2-b586-6f82-34dd-d7a812f57396@web.de>
 <alpine.DEB.2.21.1909292004460.4485@hadrien>
In-Reply-To: <alpine.DEB.2.21.1909292004460.4485@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>, cocci@systeme.lip6.fr
Cc: kernel-janitors@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Yue Haibing <yuehaibing@huawei.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicolas Palix <nicolas.palix@imag.fr>, Matthias Maennich <maennich@google.com>, linux-kernel@vger.kernel.org, Jessica Yu <jeyu@kernel.org>, Martijn Coenen <maco@android.com>

> Coccicheck requires that all rules support the report mode.

I find this requirement not so clear while this operation mode
is reasonable as a default selection.
https://bottest.wiki.kernel.org/coccicheck#modes

I am curious how the software will evolve further also in this area.
Possible solutions might become more interesting in other directions.

Regards,
Markus
