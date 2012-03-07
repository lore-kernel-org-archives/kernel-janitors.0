From: santosh prasad nayak <santoshprasadnayak@gmail.com>
Date: Wed, 07 Mar 2012 16:19:01 +0000
Subject: Re: [PATCH] [SCSI] sd: set BIO_MAPPED_INTEGRITY bit correctly in sd_dif_prepare().
Message-Id: <CAOD=uF6nG=r9GLtzdds8T_67RmOyOhD756Kj_EGXsuDgfQR7nA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1331131295-3707-1-git-send-email-santoshprasadnayak@gmail.com>
	<20120307155624.GC19570@parisc-linux.org>
In-Reply-To: <20120307155624.GC19570@parisc-linux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Matthew Wilcox <matthew@wil.cx>
Cc: JBottomley@parallels.com, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, mkp@mkp.net

On Wed, Mar 7, 2012 at 9:26 PM, Matthew Wilcox <matthew@wil.cx> wrote:
> On Wed, Mar 07, 2012 at 08:11:35PM +0530, santosh nayak wrote:
>> From: Santosh Nayak <santoshprasadnayak@gmail.com>
>>
>> Value of BIO_MAPPED_INTEGRITY is 11. Intention was to set the 11th bit.
>
> Also, can we introduce:
>
> #define bio_set_flag(bio, flag) ((bio)->bi_flags |=3D (1 << (flag)))
>

  set_bit() can do the same task.
  Can you please explain why do we need a new macro ?


> Then hunt down and kill all the places that manipulate bi_flags by hand?
> We might also need:
>
> #define bio_set_flag_atomic(bio, flag) set_bit(&(bio)->bi_flags, (flag))

for atomic operation we have __set_bit() . Is there any need to define
to new macro ?


Regards
Santosh

>
> --
> Matthew Wilcox =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Intel O=
pen Source Technology Centre
> "Bill, look, we understand that you're interested in selling us this
> operating system, but compare it to ours. =A0We can't possibly take such
> a retrograde step."
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
