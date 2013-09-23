From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 23 Sep 2013 08:47:53 +0000
Subject: Re: [patch] pinctrl: remove an unnecessary cast
Message-Id: <CACRpkdb+cRbq8B09O+CtiFVHEcvRq4K4JZ1CFNx+h4n3tPvfBA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130917104754.GA29918@elgon.mountain>
In-Reply-To: <20130917104754.GA29918@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Tue, Sep 17, 2013 at 12:47 PM, Dan Carpenter
<dan.carpenter@oracle.com> wrote:

> sizeof() is already size_t so there is no need to cast here.  Generally,
> casting inside the min() macro instead of using min_t() is considered
> bad style.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied!

Thanks,
Linus Walleij
