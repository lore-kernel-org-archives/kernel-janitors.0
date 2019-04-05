From: Tomas Bortoli <tomasbortoli@gmail.com>
Date: Fri, 05 Apr 2019 21:05:53 +0000
Subject: Re: [PATCH] Bluetooth: hci_event: potential out of bounds parsing ADV events
Message-Id: <5344bfc8-ba02-c17f-c4cd-0418d48e6fdd@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190330072511.GA5502@kadam>
 <f1baaa05-bd1d-f2cf-410a-7073e85412d3@gmail.com>
 <CAM_iQpVNqyoBirtKg-rbOHsOZCZ0Oz5PTE2sFQnHQnv6s7g2gg@mail.gmail.com>
 <20190402063313.GA32613@kadam>
 <CAM_iQpW=X2X5A873nSPM7yLBiWZM+rsJk+uMpiOioYPFsFP9vg@mail.gmail.com>
 <20190402195537.GF32613@kadam>
 <CAM_iQpU2qwezhk8XdnX+kvUi8Oi0mwNxRuFOo8uGvjZaPZGNWA@mail.gmail.com>
 <20190404080627.GG32590@kadam>
 <CAM_iQpXLoSU5f4tGtwDt9=+AQ==4CfYhnxcOmKkmvB+Yd0KNfw@mail.gmail.com>
 <20190405204838.GR32590@kadam>
In-Reply-To: <20190405204838.GR32590@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Cong Wang <xiyou.wangcong@gmail.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, Jaganath Kanakkassery <jaganath.k.os@gmail.com>, Johan Hedberg <johan.hedberg@gmail.com>, linux-bluetooth <linux-bluetooth@vger.kernel.org>, kernel-janitors@vger.kernel.org

I disagree,

they differ for me.

with unlikely:
f86cf90c9c1ef14063796f4d07ce64bf6952b536e9728d21ba86d3be2e7472d7
net/bluetooth/hci_event.o

without:
6c75194b981294cb933900100448ec335065a35ff9120333558d09aa3dd8b2da
net/bluetooth/hci_event.o


On 4/5/19 10:48 PM, Dan Carpenter wrote:
> 
> I'm don't have a lot of time for these discussions.  The object code is
> exactly the same regardless of whether you add the annotations or not.
> 
> 32c307d27583a624baa3a24eec00402e  net/bluetooth/hci_event.o.no_annotation
> 32c307d27583a624baa3a24eec00402e  net/bluetooth/hci_event.o.w_annotation
> 
> regards,
> dan carpenter
> 
