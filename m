From: Marcel Holtmann <marcel@holtmann.org>
Date: Fri, 18 Dec 2020 21:21:19 +0000
Subject: Re: [PATCH] Bluetooth: btqcomsmd: Fix a resource leak in error handling paths in the probe function
Message-Id: <53063008-8797-4395-B9D1-9D56D2D0D54C@holtmann.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201212094658.83861-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20201212094658.83861-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: agross@kernel.org, bjorn.andersson@linaro.org, Johan Hedberg <johan.hedberg@gmail.com>, MSM <linux-arm-msm@vger.kernel.org>, linux-bluetooth <linux-bluetooth@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Hi Christophe,

> Some resource should be released in the error handling path of the probe
> function, as already done in the remove function.
> 
> The remove function was fixed in commit 5052de8deff5 ("soc: qcom: smd:
> Transition client drivers from smd to rpmsg")
> 
> Fixes: 1511cc750c3d ("Bluetooth: Introduce Qualcomm WCNSS SMD based HCI driver")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> drivers/bluetooth/btqcomsmd.c | 27 +++++++++++++++++++--------
> 1 file changed, 19 insertions(+), 8 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel
