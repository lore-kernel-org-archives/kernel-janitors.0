From: Joe Perches <joe@perches.com>
Date: Mon, 18 Oct 2010 17:55:42 +0000
Subject: Re: [PATCH 1/3] drivers/staging/cx25821: Use kstrdup
Message-Id: <1287424542.20968.121.camel@Joe-Laptop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1287341311-11161-1-git-send-email-julia@diku.dk>
	 <1287341311-11161-2-git-send-email-julia@diku.dk> <4CBBF407.7060705@bfs.de>
	 <Pine.LNX.4.64.1010181019370.22530@ask.diku.dk> <4CBC12EC.60109@bfs.de>
	 <Pine.LNX.4.64.1010181421240.25099@ask.diku.dk>
	 <1287423539.20968.115.camel@Joe-Laptop>
	 <Pine.LNX.4.64.1010181942570.15744@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1010181942570.15744@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: walter harms <wharms@bfs.de>, devel@driverdev.osuosl.org, gregkh@suse.de, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 2010-10-18 at 19:44 +0200, Julia Lawall wrote:
> On Mon, 18 Oct 2010, Joe Perches wrote:
> 
> > Perhaps it's more readable code to recheck the
> > field name flag and introduce a temporary
> > char *fname so the slightly unusual reuse of
> > 	field = kstrdup(field, GFP)
> > becomes
> > 	field = kstrdup(fname, GFP)
> 
> Before I had a local variable filename.  I preferred that because I felt 
> uneasy about putting both statically and dynamically allocated memory in 
> the same field.  But it does mean adding a new local variable.

I think readability is better using a temporary.

> I'm not sure to understand "recheck the field name flag", though.

Sorry, poor wording.  I meant using this style:

	if (field && *field)
		foo
	else if (field)
		bar
	else
		baz

instead of:

	if (field) {
		if (*field)
			foo
		else
			bar
	} else
		baz


