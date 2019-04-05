From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 05 Apr 2019 20:48:38 +0000
Subject: Re: [PATCH] Bluetooth: hci_event: potential out of bounds parsing ADV events
Message-Id: <20190405204838.GR32590@kadam>
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
In-Reply-To: <CAM_iQpXLoSU5f4tGtwDt9=+AQ==4CfYhnxcOmKkmvB+Yd0KNfw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cong Wang <xiyou.wangcong@gmail.com>
Cc: Tomas Bortoli <tomasbortoli@gmail.com>, Marcel Holtmann <marcel@holtmann.org>, Jaganath Kanakkassery <jaganath.k.os@gmail.com>, Johan Hedberg <johan.hedberg@gmail.com>, linux-bluetooth <linux-bluetooth@vger.kernel.org>, kernel-janitors@vger.kernel.org


I'm don't have a lot of time for these discussions.  The object code is
exactly the same regardless of whether you add the annotations or not.

32c307d27583a624baa3a24eec00402e  net/bluetooth/hci_event.o.no_annotation
32c307d27583a624baa3a24eec00402e  net/bluetooth/hci_event.o.w_annotation

regards,
dan carpenter
