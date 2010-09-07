From: Artem Bityutskiy <dedekind1@gmail.com>
Date: Tue, 07 Sep 2010 09:32:39 +0000
Subject: Re: [PATCH 11/14] ubifs: check return code of ubifs_lpt_lookup
Message-Id: <1283851959.2979.27.camel@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1283711580-7546-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1283711580-7546-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Julia Lawall <julia@diku.dk>, Tejun Heo <tj@kernel.org>, linux-mtd@lists.infradead.org, Adrian Hunter <adrian.hunter@nokia.com>

On Sun, 2010-09-05 at 22:33 +0400, Kulikov Vasiliy wrote:
> From: Vasiliy Kulikov <segooon@gmail.com>
> 
> Function ubifs_lpt_lookup may return ERR_PTR(...). Check for it.
> 
> Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
> ---

Pushed both patches to the UBIFS tree, thanks:

http://git.infradead.org/ubifs-2.6.git

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)

