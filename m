From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 23 Nov 2019 09:40:12 +0000
Subject: Re: [PATCH] rtc: meson: remove redundant assignment to variable retries
Message-Id: <CAFBinCCd_jr7UDdQx15tnFnZwO1tCbJ+PnZtEn57LUDtiRV_eQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191122225210.109172-1-colin.king@canonical.com>
In-Reply-To: <20191122225210.109172-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Kevin Hilman <khilman@baylibre.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org

Hi Colin,

On Fri, Nov 22, 2019 at 11:52 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The variable retries is being initialized with a value that is never
> read and it is being updated later with a new value in a for-loop.
> The initialization is redundant and can be removed.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
thank you for addressing this!
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>


Martin
