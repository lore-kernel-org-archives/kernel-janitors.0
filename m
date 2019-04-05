From: Cong Wang <xiyou.wangcong@gmail.com>
Date: Fri, 05 Apr 2019 17:16:34 +0000
Subject: Re: [PATCH] Bluetooth: hci_event: potential out of bounds parsing ADV events
Message-Id: <CAM_iQpXLoSU5f4tGtwDt9=+AQ==4CfYhnxcOmKkmvB+Yd0KNfw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190330072511.GA5502@kadam> <f1baaa05-bd1d-f2cf-410a-7073e85412d3@gmail.com>
 <CAM_iQpVNqyoBirtKg-rbOHsOZCZ0Oz5PTE2sFQnHQnv6s7g2gg@mail.gmail.com>
 <20190402063313.GA32613@kadam> <CAM_iQpW=X2X5A873nSPM7yLBiWZM+rsJk+uMpiOioYPFsFP9vg@mail.gmail.com>
 <20190402195537.GF32613@kadam> <CAM_iQpU2qwezhk8XdnX+kvUi8Oi0mwNxRuFOo8uGvjZaPZGNWA@mail.gmail.com>
 <20190404080627.GG32590@kadam>
In-Reply-To: <20190404080627.GG32590@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Tomas Bortoli <tomasbortoli@gmail.com>, Marcel Holtmann <marcel@holtmann.org>, Jaganath Kanakkassery <jaganath.k.os@gmail.com>, Johan Hedberg <johan.hedberg@gmail.com>, linux-bluetooth <linux-bluetooth@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Thu, Apr 4, 2019 at 1:06 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Wed, Apr 03, 2019 at 03:55:20PM -0700, Cong Wang wrote:
> > I tried checkpatch.pl, it has no such a complain.
>
> Huh?

Huh +1?

>
> I sorry, I must have been very unclear if you're asking about
> checkpatch.  Checkpatch is a Perl script.  It's basically like grep.  It
> has no idea about fast paths or benchmarking.  Let me try explain
> better.

Sure, you said coding style, then I brought up checkpatch.pl.
If it hurts you, then I am sorry. How do you check your coding
style without checkpatch.pl? I am happy to learn. Personally I
just trust checkpatch.pl, because I don't want to waste my time
on coding styles, I never say I like it or not, I just need a tool.

Thanks for teaching me what checkpatch.pl is, although I have
been using it for so many years, it is really really helpful.


>
> The likely/unlikely annotations are there to help optimize branch
> prediction and make the code run faster.  In the real world if you can't
> benchmark or measure or detect a speed improvement then it's not a real
> speed improvement.


Personally I disagree with you on this point. You don't have to measure,
you just have to understand the code. In this case, bluetooth has linear
and sane skb's in _normal_ case, you don't disagree, do you?

So even _if_ likely()/unlikely() is only for telling which is the normal
case, it is still helpful. In this case, we want to tell non-linear skb's are
unlikely in bluetooth, you know this is true, as linear is always the case;
and, we want to tell ill-formatted skb's are unlikely too, and you know
this is also true.


>
> 1) HCI events don't happen often enough to where the speed can be easily
>    benchmarked.  In that situation, we just write the code as readably
>    as possible instead of trying to micro optimize it.

Same. It is not about benchmarking.

>
> 2) The compiler already does common sense branch prediction.  These
>    conditions look straight forward so it probably gets it right.  You

I'd be surprised if the compiler could know skb's are always linear
in this particular case.


>    should take a look at the object code.  The compiler probably gets
>    it right.  I bet that these annotations don't even affect the
>    compiled code let alone the benchmarking output.


If you are suggesting we should remove all likely()/unlikely()
from pskb_may_pull() callers, please go ahead to submit a patch
to remove them all, and see if David accepts it.


>
> I know this isn't explained in CodingStyle but some things are
> assumed.  In drivers/ about 1.5% of if statements have likely/unlikely
> annotations.  It really is not normal to add it to everything willy-nilly
> for no reason.

I don't know why you want to make the topic as broad as all
likely()/unlikely(), we are discussing likely()/unlikely() with
pskb_may_pull() together, and particularly in bluetooth.


Thanks.
