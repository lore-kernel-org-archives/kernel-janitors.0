From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 19 Dec 2015 11:12:09 +0000
Subject: Re: [patch -next] ath9k: fix ath9k_hw_nvram_check_version()
Message-Id: <CAFBinCBqLVBmkx1b5xS-2YiSvD9LY_2yR3SAAR34jiTWeOV9gg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151219105919.GB3749@mwanda>
In-Reply-To: <20151219105919.GB3749@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: QCA ath9k Development <ath9k-devel@qca.qualcomm.com>, Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org, ath9k-devel@venema.h4ckr.net, kernel-janitors@vger.kernel.org

On Sat, Dec 19, 2015 at 11:59 AM, Dan Carpenter
<dan.carpenter@oracle.com> wrote:
> There is a type bug so it always returns success.
>
> Fixes: 6fa658fd5ab2 ('ath9k: Simplify and fix eeprom endianness swapping')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>


Thank you for finding and fixing this one!
