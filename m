From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 04 Apr 2019 08:06:27 +0000
Subject: Re: [PATCH] Bluetooth: hci_event: potential out of bounds parsing ADV events
Message-Id: <20190404080627.GG32590@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190330072511.GA5502@kadam>
 <f1baaa05-bd1d-f2cf-410a-7073e85412d3@gmail.com>
 <CAM_iQpVNqyoBirtKg-rbOHsOZCZ0Oz5PTE2sFQnHQnv6s7g2gg@mail.gmail.com>
 <20190402063313.GA32613@kadam>
 <CAM_iQpW=X2X5A873nSPM7yLBiWZM+rsJk+uMpiOioYPFsFP9vg@mail.gmail.com>
 <20190402195537.GF32613@kadam>
 <CAM_iQpU2qwezhk8XdnX+kvUi8Oi0mwNxRuFOo8uGvjZaPZGNWA@mail.gmail.com>
In-Reply-To: <CAM_iQpU2qwezhk8XdnX+kvUi8Oi0mwNxRuFOo8uGvjZaPZGNWA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cong Wang <xiyou.wangcong@gmail.com>
Cc: Tomas Bortoli <tomasbortoli@gmail.com>, Marcel Holtmann <marcel@holtmann.org>, Jaganath Kanakkassery <jaganath.k.os@gmail.com>, Johan Hedberg <johan.hedberg@gmail.com>, linux-bluetooth <linux-bluetooth@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Apr 03, 2019 at 03:55:20PM -0700, Cong Wang wrote:
> I tried checkpatch.pl, it has no such a complain.

Huh?

I sorry, I must have been very unclear if you're asking about
checkpatch.  Checkpatch is a Perl script.  It's basically like grep.  It
has no idea about fast paths or benchmarking.  Let me try explain
better.

The likely/unlikely annotations are there to help optimize branch
prediction and make the code run faster.  In the real world if you can't
benchmark or measure or detect a speed improvement then it's not a real
speed improvement.

1) HCI events don't happen often enough to where the speed can be easily
   benchmarked.  In that situation, we just write the code as readably
   as possible instead of trying to micro optimize it.

2) The compiler already does common sense branch prediction.  These
   conditions look straight forward so it probably gets it right.  You
   should take a look at the object code.  The compiler probably gets
   it right.  I bet that these annotations don't even affect the
   compiled code let alone the benchmarking output.

So in this case, we are not adding likely and unlikely for their
intended purpose of improving benchmarks.  I guess we are instead adding
them just for the human readers?  But most people can immediately see
that this is an error path so they don't need the annotations.  In fact
the annotations obscure what the error condition is so they hurt
readability.  Now there are just too many parentheses to keep track of.

	if (unlikely(!pskb_may_pull(skb, sizeof(*rp))))
		return;

	if (!pskb_may_pull(skb, sizeof(*rp)))
		return;

I know this isn't explained in CodingStyle but some things are
assumed.  In drivers/ about 1.5% of if statements have likely/unlikely
annotations.  It really is not normal to add it to everything willy-nilly
for no reason.

regards,
dan carpenter
