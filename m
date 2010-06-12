From: Artem Bityutskiy <dedekind1@gmail.com>
Date: Sat, 12 Jun 2010 11:53:28 +0000
Subject: Re: [PATCH 4/8] fs/ubifs: Use ERR_CAST
Message-Id: <1276343608.19028.118.camel@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1005221200050.13021@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1005221200050.13021@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Julia Lawall <julia@diku.dk>
Cc: kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Adrian Hunter <adrian.hunter@nokia.com>

On Sat, 2010-05-22 at 12:00 +0200, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> Use ERR_CAST(x) rather than ERR_PTR(PTR_ERR(x)).  The former makes more
> clear what is the purpose of the operation, which otherwise looks like a
> no-op.

Pushed to the ubifs-2.6.git tree, thank you!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)

