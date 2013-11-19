From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Nov 2013 07:56:57 +0000
Subject: Re: [patch] pinctrl: rockchip: testing the wrong variable
Message-Id: <CACRpkdauBBn2A_byet6VrYo3Wok=Rf1MjJqE8H9G4BJXqgTrpA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131108100138.GO27977@elgon.mountain>
In-Reply-To: <20131108100138.GO27977@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Fri, Nov 8, 2013 at 11:01 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:

> There is a copy and paste bug so we test "info->reg_base" instead of
> "info->reg_pull".
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied for fixes with Heiko's ACK.

Yours,
Linus Walleij
