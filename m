From: Girish Verma <girish@circuitsutra.com>
Date: Sun, 13 May 2012 14:12:19 +0000
Subject: Re: [PATCH] USB: XHCI: xhci-ring: Remove unused dma address calculation in inc_enq and inc_deq funct
Message-Id: <CAOf1Mzt788H9B7hV3G_t8Atr5S-8m_2_1AOT=kxSVbNvqczg8Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAOf1Mzv=+zSVCDgPcHhVvN6YCbhM8R2w6DDL80EbYTuA0EGpCw@mail.gmail.com>
 <4FAFB85F.1030604@mvista.com>
In-Reply-To: <4FAFB85F.1030604@mvista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Sergei Shtylyov <sshtylyov@mvista.com>
Cc: kernel-janitors@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, sarah.a.sharp@linux.intel.com, gregkh@linuxfoundation.org

Thank for the information, I will resend the patch

On Sun, May 13, 2012 at 7:04 PM, Sergei Shtylyov <sshtylyov@mvista.com> wro=
te:
> Hello.
>
> On 13-05-2012 5:06, Girish Verma wrote:
>
>> Hi,
>
>
> =A0 Greeting shouldn't be a part of the changelog.
>
>
>> in xhci-ring.c, function inc_enq and inc_deq calculate the dma address
>> of trb but never used. This calculation may be used for debugging
>> purpose, in that case this code should be part of debug flag.
>
>
>> Signed-off-by: Girish Verma<girish@circuitsutra.com>
>> ---
>> =A0drivers/usb/host/xhci-ring.c | =A0 =A04 ----
>> =A01 files changed, 0 insertions(+), 4 deletions(-)
>
>
>> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
>> index 3d9422f..dcd67c1 100644
>> --- a/drivers/usb/host/xhci-ring.c
>> +++ b/drivers/usb/host/xhci-ring.c
>
> [...]
>
>> @@ -168,7 +167,6 @@ static void inc_deq(struct xhci_hcd *xhci, struct
>> xhci_ring *ring)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ring->dequeue =3D ring->deq_seg->trbs;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0next =3D ring->dequeue;
>> =A0 =A0 =A0 =A0}
>> - =A0 =A0 =A0 addr =3D (unsigned long long) xhci_trb_virt_to_dma(ring->d=
eq_seg,
>> ring->dequeue);
>
>
> =A0 Your patch is line-wrapped. Maybe the amintainer would be able to fix=
 this
> tho...
>
> WBR, Sergei
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
