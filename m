From: Artem Bityutskiy <dedekind@infradead.org>
Date: Fri, 29 Aug 2008 10:35:14 +0000
Subject: Re: [PATCH] fs/ubifs: Use an IS_ERR test rather than a NULL test
Message-Id: <1220006114.4036.16.camel@sauron>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200808291108.32958.brunel@diku.dk>
In-Reply-To: <200808291108.32958.brunel@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Julien Brunel <brunel@diku.dk>
Cc: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, 2008-08-29 at 11:08 +0200, Julien Brunel wrote:
> In case of error, the function kthread_create returns an ERR pointer,
> but never returns a NULL pointer. So a NULL test that comes before an
> IS_ERR test should be deleted.
> 
> The semantic match that finds this problem is as follows:
> (http://www.emn.fr/x-info/coccinelle/)

Pushed to ubifs-2.6.git, thanks.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)

