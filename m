From: David Miller <davem@davemloft.net>
Date: Tue, 19 Nov 2019 00:47:12 +0000
Subject: Re: [PATCH v2 1/1] net: Fix comment block per style guide
Message-Id: <20191118.164712.488135429319455452.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191118220609.GA23999@Cheese>
In-Reply-To: <20191118220609.GA23999@Cheese>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: tdavies@darkphysics.net
Cc: akpm@linux-foundation.org, julia.lawall@lip6.fr, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Travis Davies <tdavies@darkphysics.net>
Date: Mon, 18 Nov 2019 14:06:09 -0800

> This patch places /* and */ on separate lines for a
> multiline block comment, in order to keep code style
> consistant with majority of blocks throughout the file.
> 
> This will prevent a checkpatch.pl warning:
> 'Block comments use a trailing */ on a separate line'
> 
> Signed-off-by: Travis Davies <tdavies@darkphysics.net>
> ---
> -v2: Fix commit description, and subject line as suggested by 
>      Julie Lawall

The comment style used here is so pervasive in the kernel networking,
I'm really not thrilled to start seeing these picked away one by
one.  So much churn...

Sorry I'm not applying this...
