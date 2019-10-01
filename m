From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 01 Oct 2019 15:33:47 +0000
Subject: Re: [Cocci] [RFC] scripts: Fix coccicheck failed
Message-Id: <15b52ec6-1cb4-f419-351a-07241cdb8674@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191001125742.GD90796@google.com>
In-Reply-To: <20191001125742.GD90796@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthias Maennich <maennich@google.com>, Yue Haibing <yuehaibing@huawei.com>, Coccinelle <cocci@systeme.lip6.fr>, kernel-janitors@vger.kernel.org
Cc: Michal Marek <michal.lkml@markovi.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, Jessica Yu <jeyu@kernel.org>, Martijn Coenen <maco@android.com>

> >+virtual report
> >+
> > @has_ns_import@
> > declarer name MODULE_IMPORT_NS;
> > identifier virtual.ns;
> >
> >Adding virtual report make the coccicheck go ahead smoothly.

Such an adjustment might be an interesting solution.


> Thanks for reporting and following up with this issue. I certainly did
> not expect all scripts in scripts/coccinelle to be automatically called
> by coccicheck

Did you (or any other contributor) test the collaboration of the added
small SmPL file with the known call interface?


> and I still think scripts/coccinelle is the right location
> for add_namespace.cocci.

I got additional software development ideas around this view in the meantime.
Would you like to take any other collateral evolution better into account?

Regards,
Markus
