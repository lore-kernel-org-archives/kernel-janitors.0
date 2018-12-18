From: Mika Westerberg <mika.westerberg@linux.intel.com>
Date: Tue, 18 Dec 2018 12:44:31 +0000
Subject: Re: [PATCH][next] gpiolib-acpi: remove unused variable 'err', cleans up build warning
Message-Id: <20181218124431.GK2469@lahna.fi.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181218122802.28157-1-colin.king@canonical.com>
In-Reply-To: <20181218122802.28157-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Colin King <colin.king@canonical.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Dec 18, 2018 at 12:28:02PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable err is defined but never used. Remove it. Cleans up warning:
> 
> warning: unused variable ‘err’ [-Wunused-variable]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
