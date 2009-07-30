From: Nicolas Palix <npalix@diku.dk>
Date: Thu, 30 Jul 2009 18:35:08 +0000
Subject: Re: [PATCH] Staging: hv: Replace typedef SG_BUFFER_LIST by struct
Message-Id: <Pine.LNX.4.64.0907302020250.13698@ask.diku.dk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="-511516320-909263340-1248978908=:13698"
List-Id: <kernel-janitors.vger.kernel.org>
References: <200907301737.23849.npalix@diku.dk> <20090730155844.GB20557@suse.de>
In-Reply-To: <20090730155844.GB20557@suse.de>
To: Greg KH <gregkh@suse.de>
Cc: hjanssen@microsoft.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---511516320-909263340-1248978908=:13698
Content-Type: TEXT/PLAIN; charset="iso-8859-1"; format="flowed"
Content-Transfer-Encoding: quoted-printable

On Thu, 30 Jul 2009, Greg KH wrote:

> On Thu, Jul 30, 2009 at 05:37:23PM +0200, Nicolas Palix wrote:
>>
>> typedef SG_BUFFER_LIST is removed and its uses are replaced by the use of
>> struct scatterlist.
>
> Sweet!  thanks for doing this, very nice job, I'll go queue it up.

I tried to change the RingBuffer too but I did not know
which API I should use.
The ring buffer in kernel/trace seems fine but it has some
dedicated features.

Any hint?
Of which infrastructure are you thinking in your previous mail?

>
> Hank, you are testing the linux-next tree to make sure we haven't broken
> anything yet, right? :)
>
> thanks,
>
> greg k-h

You=B4re welcome.

Nicolas Palix

> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors=
" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
---511516320-909263340-1248978908=:13698--
