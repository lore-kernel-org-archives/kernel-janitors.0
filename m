From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 29 Aug 2018 13:54:13 +0000
Subject: Re: [PATCH] power: supply: remove unused pointer 'dev'
Message-Id: <CAJKOXPcy3emsEPRRK+sKxe51ZWPoVscwHdrVz0fw7vJfLh9HWw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180828162842.17503-1-colin.king@canonical.com>
In-Reply-To: <20180828162842.17503-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: sre@kernel.org, linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 28 Aug 2018 at 18:29, Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> Pointer 'dev' is being assigned but is never used hence it is
> redundant and can be removed.
>
> Cleans up clang warning:
> variable 'dev' set but not used [-Wunused-but-set-variable]
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/power/supply/cros_usbpd-charger.c | 2 --
>  1 file changed, 2 deletions(-)
>

Maybe add cros_usbpd prefix to the subject?

Anyway:
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
