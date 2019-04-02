From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 02 Apr 2019 19:55:37 +0000
Subject: Re: [PATCH] Bluetooth: hci_event: potential out of bounds parsing ADV events
Message-Id: <20190402195537.GF32613@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190330072511.GA5502@kadam>
 <f1baaa05-bd1d-f2cf-410a-7073e85412d3@gmail.com>
 <CAM_iQpVNqyoBirtKg-rbOHsOZCZ0Oz5PTE2sFQnHQnv6s7g2gg@mail.gmail.com>
 <20190402063313.GA32613@kadam>
 <CAM_iQpW=X2X5A873nSPM7yLBiWZM+rsJk+uMpiOioYPFsFP9vg@mail.gmail.com>
In-Reply-To: <CAM_iQpW=X2X5A873nSPM7yLBiWZM+rsJk+uMpiOioYPFsFP9vg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cong Wang <xiyou.wangcong@gmail.com>
Cc: Tomas Bortoli <tomasbortoli@gmail.com>, Marcel Holtmann <marcel@holtmann.org>, Jaganath Kanakkassery <jaganath.k.os@gmail.com>, Johan Hedberg <johan.hedberg@gmail.com>, linux-bluetooth <linux-bluetooth@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Tue, Apr 02, 2019 at 10:42:38AM -0700, Cong Wang wrote:
> I think these likely()/unlikely() are reasonable, ill-formatted packets
> are rare cases, normal packets deserve such a special care. We
> use likely()/unlikely() with pskb_may_pull() in many places in
> networking subsystem, at least.

The likely()/unlikely() annotations are to help the compiler optimize
the fast path.  They are not there just for decorating the code.  We
should only use likely()/unlikely() where it makes a difference in
benchmarking.  Otherwise it's just a style question, right (obviously)?
And it's better style to write things as simply as possible.

regards,
dan carpenter
