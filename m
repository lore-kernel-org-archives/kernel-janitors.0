From: Artem Bityutskiy <dedekind@infradead.org>
Date: Fri, 26 Sep 2008 14:48:48 +0000
Subject: Re: [PATCH] drivers/mtd/ubi: Bad IS_ERR test
Message-Id: <1222440528.5012.19.camel@sauron>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200809261527.26007.brunel@diku.dk>
In-Reply-To: <200809261527.26007.brunel@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Julien Brunel <brunel@diku.dk>
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org, haver@vnet.ibm.com, linux-kernel@vger.kernel.org

On Fri, 2008-09-26 at 15:27 +0200, Julien Brunel wrote:
> In case of error, the function add_volume returns an ERR pointer. The
> result of IS_ERR, which is supposed to be used in a test as it is, is
> here checked to be less than zero, which seems odd. We suggest to
> replace this test by a simple IS_ERR test.

Pushed to ubi-2.6.git, thank you!

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)

