From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 05 Apr 2019 21:14:14 +0000
Subject: Re: [PATCH] Bluetooth: hci_event: potential out of bounds parsing ADV events
Message-Id: <20190405211414.GT32590@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f1baaa05-bd1d-f2cf-410a-7073e85412d3@gmail.com>
 <CAM_iQpVNqyoBirtKg-rbOHsOZCZ0Oz5PTE2sFQnHQnv6s7g2gg@mail.gmail.com>
 <20190402063313.GA32613@kadam>
 <CAM_iQpW=X2X5A873nSPM7yLBiWZM+rsJk+uMpiOioYPFsFP9vg@mail.gmail.com>
 <20190402195537.GF32613@kadam>
 <CAM_iQpU2qwezhk8XdnX+kvUi8Oi0mwNxRuFOo8uGvjZaPZGNWA@mail.gmail.com>
 <20190404080627.GG32590@kadam>
 <CAM_iQpXLoSU5f4tGtwDt9=+AQ==4CfYhnxcOmKkmvB+Yd0KNfw@mail.gmail.com>
 <20190405204838.GR32590@kadam>
 <5344bfc8-ba02-c17f-c4cd-0418d48e6fdd@gmail.com>
In-Reply-To: <5344bfc8-ba02-c17f-c4cd-0418d48e6fdd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tomas Bortoli <tomasbortoli@gmail.com>
Cc: Cong Wang <xiyou.wangcong@gmail.com>, Marcel Holtmann <marcel@holtmann.org>, Jaganath Kanakkassery <jaganath.k.os@gmail.com>, Johan Hedberg <johan.hedberg@gmail.com>, linux-bluetooth <linux-bluetooth@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, Apr 05, 2019 at 11:05:53PM +0200, Tomas Bortoli wrote:
> I disagree,
> 
> they differ for me.
> 
> with unlikely:
> f86cf90c9c1ef14063796f4d07ce64bf6952b536e9728d21ba86d3be2e7472d7
> net/bluetooth/hci_event.o
> 
> without:
> 6c75194b981294cb933900100448ec335065a35ff9120333558d09aa3dd8b2da
> net/bluetooth/hci_event.o
> 

Are you sure you didn't change any line numbers or something?

regards,
dan carpenter
