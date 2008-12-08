From: Martin Schwidefsky <schwidefsky@de.ibm.com>
Date: Mon, 08 Dec 2008 09:06:29 +0000
Subject: Re: [PATCH 1/2] drivers/s390/crypto: Move dereference to after
Message-Id: <1228727189.15048.1.camel@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0812072314270.7130@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0812072314270.7130@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: heiko.carstens@de.ibm.com, linux390@de.ibm.com, linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, 2008-12-07 at 23:14 +0100, Julia Lawall wrote:
> If reply is ERR_PTR(...), then it should not be dereferenced, so I have
> moved the dereference from the declaration to after the IS_ERR test.

Nice finding again. That semantic match tools is really useful.
Thanks, I'll add the patch to my collection.

-- 
blue skies,
  Martin.

"Reality continues to ruin my life." - Calvin.


