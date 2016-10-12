From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 12 Oct 2016 08:43:02 +0000
Subject: Re: [patch] gpio: stmpe: || vs && typo
Message-Id: <CACRpkdbxemFszSPUceuMvpqcyzuuDCTYSA5uvA=sgyp==hw8oA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161012062520.GY12841@mwanda>
In-Reply-To: <20161012062520.GY12841@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Patrice Chotard <patrice.chotard@st.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Oct 12, 2016 at 8:25 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:

> && was obviously intended here.
>
> Fixes: 6936e1f88d23 ('gpio: stmpe: Write int status register only when needed')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied with Patrice's ACK.

Yours,
Linus Walleij
