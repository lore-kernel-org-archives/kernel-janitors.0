From: Daniel Drake <drake@endlessm.com>
Date: Mon, 20 Apr 2015 16:18:17 +0000
Subject: Re: [patch] Bluetooth: btusb: off by one in rtl8723b_parse_firmware()
Message-Id: <CAD8Lp46BQFGGuAqt-rosHCjY7tYnk3kp-_98dQ1kjugO-XjODg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150420155135.GB10518@mwanda>
In-Reply-To: <20150420155135.GB10518@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, Gustavo Padovan <gustavo@padovan.org>, Johan Hedberg <johan.hedberg@gmail.com>, Linux Bluetooth mailing list <linux-bluetooth@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Mon, Apr 20, 2015 at 9:51 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> The ">" should be ">=" so that we don't read past the end of the array.
>
> Fixes: 9d9a113e3695 ('Bluetooth: btusb: Add Realtek 8723A/8723B/8761A/8821A support')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Oops! Your fix looks correct.

Thanks
Daniel
