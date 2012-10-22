From: "devendra.aaru" <devendra.aaru@gmail.com>
Date: Mon, 22 Oct 2012 15:52:15 +0000
Subject: Re: [staging:staging-next 115/274] drivers/staging/ced1401/usb1401.c:1065 Handle1401Esc() error: dou
Message-Id: <CAHdPZaOK=PVWiGKH5=caOBB9h2AMhzQBVTZiyPVMcUNRTt-jEA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAHdPZaPfEFkPmH_46uFQMMU4aiN1RmxFftMk02M58S4Z_CWxMw@mail.gmail.com>
In-Reply-To: <CAHdPZaPfEFkPmH_46uFQMMU4aiN1RmxFftMk02M58S4Z_CWxMw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Oct 22, 2012 at 6:42 AM, Alois Schloegl
<alois.schloegl@ist.ac.at> wrote:
> Hi,
>
>
> Please include (Greg Smith <greg@ced.co.uk>) into any communication.
> Greg Smith from CED noticed that there is no kfree, causing a memory leak,

right i fixed it up and sent a patch.

> and memset() has been removed, thus tx->used was not cleared.

because i used kzalloc which does memset of allocated memory.

Thanks.
