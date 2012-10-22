From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 22 Oct 2012 09:23:52 +0000
Subject: Re: a dedicated list for build error reports?
Message-Id: <20121022092352.GB7329@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121018130146.GA11433@localhost>
In-Reply-To: <20121018130146.GA11433@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Oct 22, 2012 at 04:18:20PM +0800, Fengguang Wu wrote:
> 
> Good idea. I can do the summary if the too many reports are a problem
> for the list.

I would do fine with the summary as well.  Perhaps if I could add a
procmail filter so it would go into its own mailbox.  I would modify
my scripts to grep for the error before sending a dublicate report.

The thing about the reports are that it's not actually anything that
janitors can help out with.  Normally it's in some tree that no one
has and the author takes care of the fix.

regards,
dan carpenter
