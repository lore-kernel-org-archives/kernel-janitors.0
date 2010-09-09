From: Maciej Grela <maciej.grela@gmail.com>
Date: Thu, 09 Sep 2010 13:53:24 +0000
Subject: Re: Opinion about Linux Foundation courses
Message-Id: <AANLkTinuwdXpjVv47ui+i4Xr-oANMLB3w46eP-eC_Mxe@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <AANLkTikugt28Lsf9wgCyOD=t4SK4pMyCNxCU5Yahs_nz@mail.gmail.com>
In-Reply-To: <AANLkTikugt28Lsf9wgCyOD=t4SK4pMyCNxCU5Yahs_nz@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

2010/9/9 Kevin McKinney <klmckinney1@gmail.com>:
> Hi All,
>
> On Thu, Sep 9, 2010 at 6:45 AM, Andre Nogueira <andre.neo.net@gmail.com> wrote:
>>
>> Hi.
>>
>
> In addition, I spent a lot of time trying to create a serial TTL port
> to RS232 serial cable with no luck. I understand the need for this;
> (to boot into a specific kernel); however I am not sure how to create
> this cable.  I was able to boot into a kernel of my choosing a
> different way; but can someone provide guidance on the creation of the
> cable for my own edification.
>

The best approach to do this is to buy a USB cable used to connect an
old cellphone to a PC. They're pretty cheap and contain a USB <->
RS232 3.3 V converter (usually PL2303). Most popular converter chips
work with Linux out-of-the-box.
You need to take the cable apart and just solder your own plug on the
"cellphone" side. Before that, make sure you know which pin is the
TXD, RXD and GND using the chip's datasheet and a continuity meter.

Br,
Maciej Grela
