From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 17 Feb 2017 13:39:38 +0000
Subject: Re: [bug report] net: Prepare gro for packet consuming gro callbacks
Message-Id: <20170217133938.GL4162@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170216201127.GA11170@mwanda>
In-Reply-To: <20170216201127.GA11170@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The only static checkers which care about ERR_PTR are Smatch and
Coccinelle.  I don't think Coccinelle would care about that so it must
be a Smatch warning...

:/

The only thing I can think of is that this is a Smatch warning that
"pp is not an error pointer".  And that would be because the cross
function database wasn't fully populated...  I'm not positive on that.

Very strange.

regards,
dan carpenter
