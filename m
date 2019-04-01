From: Cong Wang <xiyou.wangcong@gmail.com>
Date: Mon, 01 Apr 2019 18:03:53 +0000
Subject: Re: [PATCH] Bluetooth: hci_event: potential out of bounds parsing ADV events
Message-Id: <CAM_iQpVNqyoBirtKg-rbOHsOZCZ0Oz5PTE2sFQnHQnv6s7g2gg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190330072511.GA5502@kadam> <f1baaa05-bd1d-f2cf-410a-7073e85412d3@gmail.com>
In-Reply-To: <f1baaa05-bd1d-f2cf-410a-7073e85412d3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tomas Bortoli <tomasbortoli@gmail.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Marcel Holtmann <marcel@holtmann.org>, Jaganath Kanakkassery <jaganath.k.os@gmail.com>, Johan Hedberg <johan.hedberg@gmail.com>, linux-bluetooth <linux-bluetooth@vger.kernel.org>, kernel-janitors@vger.kernel.org

Hi,

On Sat, Mar 30, 2019 at 2:23 AM Tomas Bortoli <tomasbortoli@gmail.com> wrote:
>
> Hi Dan,
>
> On 3/30/19 8:25 AM, Dan Carpenter wrote:
> > There is a potential out of bounds if "ev->length" is too high or if the
> > number of reports are too many.
> >
> > Fixes: c215e9397b00 ("Bluetooth: Process extended ADV report event")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Reviewed-By: Tomas Bortoli <tomasbortoli@gmail.com>

I sent a patchset to fix all of this kind of OOB:
https://marc.info/?l=linux-netdev&m5314874622831&w=2

Unfortunately I get no response...

Does any of you mind to look at them?

Thanks.
