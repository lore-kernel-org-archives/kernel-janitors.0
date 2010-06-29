From: Dan Carpenter <error27@gmail.com>
Date: Tue, 29 Jun 2010 19:01:32 +0000
Subject: Re: [PATCH 01/25] r852: remove casts from void*
Message-Id: <20100629190132.GP19184@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1277806498-30738-1-git-send-email-segooon@gmail.com> <20100629123850.GO19184@bicker> <20100629152823.GA4268@shinshilla>
In-Reply-To: <20100629152823.GA4268@shinshilla>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: Kernel Janitors <kernel-janitors@vger.kernel.org>, linux-kernel@vger.kernel.org

On Tue, Jun 29, 2010 at 07:28:26PM +0400, Kulikov Vasiliy wrote:
> > 1) The subjects are not helpful.  This one should say something about
> > "mtd" but it doesn't.
> ok
> 
> > 2) These haven't been run through checkpatch.pl.
> Sorry for dummy question, but shouldn't code style be consistent?
> Somebody who will see old code and patched code will see one line with
> wrong-style code then one line with ok then one with wrong etc.
> Imho it's better to fix style in one big patch.

No.  If there's only one good line in a whole file, that's at least
better than nothing.

regards,
dan carpenter

