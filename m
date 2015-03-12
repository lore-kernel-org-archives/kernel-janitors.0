From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 12 Mar 2015 17:19:26 +0000
Subject: Re: [patch 1/2] staging: dgnc: some off by one bugs
Message-Id: <20150312171926.GM16501@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150312170739.GA21911@mwanda>
In-Reply-To: <20150312170739.GA21911@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lidza Louina <lidza.louina@gmail.com>
Cc: Mark Hounschell <markh@compro.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, driverdev-devel@linuxdriverproject.org, linux-serial@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Mar 12, 2015 at 08:07:39PM +0300, Dan Carpenter wrote:
> "dgnc_NumBoards" is the number of filled out elements in the
> dgnc_Board[] array.  "->nasync" and "->maxports" are the value.

I meant "the *same* value".  I'll resend.

regards,
dan carpenter

