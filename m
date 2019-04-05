From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 05 Apr 2019 21:23:04 +0000
Subject: Re: [PATCH] Bluetooth: hci_event: potential out of bounds parsing ADV events
Message-Id: <20190405212304.GW32613@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190402063313.GA32613@kadam>
 <CAM_iQpW=X2X5A873nSPM7yLBiWZM+rsJk+uMpiOioYPFsFP9vg@mail.gmail.com>
 <20190402195537.GF32613@kadam>
 <CAM_iQpU2qwezhk8XdnX+kvUi8Oi0mwNxRuFOo8uGvjZaPZGNWA@mail.gmail.com>
 <20190404080627.GG32590@kadam>
 <CAM_iQpXLoSU5f4tGtwDt9=+AQ==4CfYhnxcOmKkmvB+Yd0KNfw@mail.gmail.com>
 <20190405204838.GR32590@kadam>
 <5344bfc8-ba02-c17f-c4cd-0418d48e6fdd@gmail.com>
 <20190405211414.GT32590@kadam>
 <CAAHj5qj3PciY8ngqSGzH3=TQcm5vCghb0Z_0Y3DFQjTLMUM-9Q@mail.gmail.com>
In-Reply-To: <CAAHj5qj3PciY8ngqSGzH3=TQcm5vCghb0Z_0Y3DFQjTLMUM-9Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tomas Bortoli <tomasbortoli@gmail.com>
Cc: Cong Wang <xiyou.wangcong@gmail.com>, Marcel Holtmann <marcel@holtmann.org>, Jaganath Kanakkassery <jaganath.k.os@gmail.com>, Johan Hedberg <johan.hedberg@gmail.com>, linux-bluetooth <linux-bluetooth@vger.kernel.org>, kernel-janitors@vger.kernel.org

I only deleted one unlikely() from around an unlikely(!pskb_may_pull())
check.  I made sure that the line numbers and debug symbols all stayed
exactly the same...  I just re-ran my experiment with the same results.

It's weird that you're getting different object code.  This stuff isn't
a new feature in GCC, it's at least 10 years old.

regards,
dan carpenter
