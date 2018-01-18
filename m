From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 18 Jan 2018 11:03:34 +0000
Subject: Re: [PATCH] platform/x86: dell-smbios: Fix error handling in build_tokens_sysfs()
Message-Id: <20180118110334.v33ypxsavbmq6qpu@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180118104503.GA30055@mwanda>
 <5A607BF6.6090800@bfs.de>
In-Reply-To: <5A607BF6.6090800@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: walter harms <wharms@bfs.de>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Mario Limonciello <mario.limonciello@dell.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Jan 18, 2018 at 11:50:30AM +0100, walter harms wrote:
> > @@ -523,7 +523,7 @@ static int build_tokens_sysfs(struct platform_device *dev)
> >  	return 0;
> >  
> >  out_unwind_strings:
> > -	for (i = i-1; i > 0; i--) {
> > +	for (i = i-1; i >= 0; i--) {
> >  		kfree(token_location_attrs[i].attr.name);
> >  		kfree(token_value_attrs[i].attr.name);
> >  	}
> 
> would you mind to reverse order here ?
> you know programmers are terrible at couting backwards.

I prefer to always unwind in reverse order so I'd prefer to leave it
as-is.

regards,
dan carpenter

