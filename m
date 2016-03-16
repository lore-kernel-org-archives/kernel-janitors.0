From: Julian Calaby <julian.calaby@gmail.com>
Date: Wed, 16 Mar 2016 00:57:52 +0000
Subject: Re: wireless-drivers: random cleanup patches piling up
Message-Id: <CAGRGNgWkqApcjtEq_K8PQugoHxUSBxfSGJE1Mc+3_W2H9J8GrQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <87wpr3x9ln.fsf@kamboji.qca.qualcomm.com> <1453423965.3856.22.camel@perches.com>
 <87k2n1x0sf.fsf@kamboji.qca.qualcomm.com> <20160122151211.GB1500@tuxdriver.com>
 <87si1pvcd7.fsf@kamboji.qca.qualcomm.com> <20160126052823.GA2053@sudip-laptop>
 <87bn84kdu0.fsf@kamboji.qca.qualcomm.com> <20160201044142.GC4072@sudip-pc> <878u34j0wz.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <878u34j0wz.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>, "John W. Linville" <linville@tuxdriver.com>, Joe Perches <joe@perches.com>, linux-wireless <linux-wireless@vger.kernel.org>, kbuild test robot <lkp@intel.com>, kernel-janitors <kernel-janitors@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

Hi Kalle,

On Mon, Feb 1, 2016 at 7:21 PM, Kalle Valo <kvalo@codeaurora.org> wrote:
> Sudip Mukherjee <sudipm.mukherjee@gmail.com> writes:
>
>> Sure, I am starting that way. I checked in patchwork and I do not see
>> any checkpatch related patch pending (except staging, which Greg will
>> handle). I think you must have cleared all of them.
>
> They are in deferred state. The search functionality in patchwork is not
> that intuitive and they are not easy to find so here's a direct link:
>
> https://patchwork.kernel.org/project/linux-wireless/list/?state=10&order=
=DAte

I'm currently going through that list and producing a bundle of
"applyable" patches.

My criteria is:
1. The change is sane.
2. It's either obviously correct, I can review it, or someone else has
reviewed or acked it.
3. No changes other than rebasing and fixing commit messages are
required to apply it.

Some of these patches need work on their commit messages, some are
complicated enough that I feel I should be providing review notes so
someone else can double check my review, and all of them should be
rebased and compile tested. Also, some are controversial, so I'll be
segregating them from the main set.

How would you like me to communicate this list to you? I'm happy to
provide branches you can pull from or I could just post updated
versions to the list and give reviewed-by tags to those that don't
need more work.

Every patch will get an email on linux-wireless regardless.

Thanks,

--=20
Julian Calaby

Email: julian.calaby@gmail.com
Profile: http://www.google.com/profiles/julian.calaby/
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
