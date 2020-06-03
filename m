From: Marcel Holtmann <marcel@holtmann.org>
Date: Wed, 03 Jun 2020 17:56:18 +0000
Subject: Re: [PATCH] Bluetooth: hci_qca: Fix an error pointer dereference
Message-Id: <95074BC2-C7A8-44F7-9C14-0B82E26D05A9@holtmann.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200529095948.GA1304852@mwanda>
In-Reply-To: <20200529095948.GA1304852@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Rocky Liao <rjliao@codeaurora.org>, Johan Hedberg <johan.hedberg@gmail.com>, Bluez mailing list <linux-bluetooth@vger.kernel.org>, kernel-janitors@vger.kernel.org

Hi Dan,

> When a function like devm_clk_get_optional() function returns both error
> pointers on error and NULL then the NULL return means that the optional
> feature is deliberately disabled.  It is a special sort of success and
> should not trigger an error message.  The surrounding code should be
> written to check for NULL and not crash.
> 
> On the other hand, if we encounter an error, then the probe from should
> clean up and return a failure.
> 
> In this code, if devm_clk_get_optional() returns an error pointer then
> the kernel will crash inside the call to:
> 
> 	clk_set_rate(qcadev->susclk, SUSCLK_RATE_32KHZ);
> 
> The error handling must be updated to prevent that.
> 
> Fixes: 77131dfec6af ("Bluetooth: hci_qca: Replace devm_gpiod_get() with devm_gpiod_get_optional()")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Commit 77131dfec6af ("Bluetooth: hci_qca: Replace devm_gpiod_get() with
> devm_gpiod_get_optional()") changed how qcadev->bt_en is handled as
> well.  From a very strict perspective the new code is buggy because the
> warnings should only be printed for error pointers, but currently errors
> are ignored and warnings are printed for NULL.
> 
> However this bug does not lead to a crash so I have left it as is.
> 
> drivers/bluetooth/hci_qca.c | 18 +++++++++---------
> 1 file changed, 9 insertions(+), 9 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel
