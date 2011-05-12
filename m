From: matt mooney <mfmooney@gmail.com>
Date: Thu, 12 May 2011 05:32:51 +0000
Subject: Re: [PATCH 09/12 v3] staging: usbip: edit Kconfig and rename CONFIG options
Message-Id: <BANLkTin=sdSp_kpL1SWSxZHBqa20RB3Y-A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1305103212.git.mfm@muteddisk.com>
	<b6b196f84ae6b8f3c74ae20f4096b556e96503ee.1305177223.git.mfm@muteddisk.com>
	<20110512053236.GA26983@kroah.com>
In-Reply-To: <20110512053236.GA26983@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg KH <greg@kroah.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, May 11, 2011 at 10:32 PM, Greg KH <greg@kroah.com> wrote:
> On Wed, May 11, 2011 at 10:17:08PM -0700, mfmooney@gmail.com wrote:
>> From: matt mooney <mfm@muteddisk.com>
>>
>> Change modules usbip_common_mod to usbip-core and usbip to usbip-host;
>> edit configuration option help text; rename CONFIG options to use a
>> USBIP prefix and change COMMON to CORE in both the Kconfig and
>> Makefiles; edit the menu entries and the driver descriptions.
>>
>> Signed-off-by: matt mooney <mfm@muteddisk.com>
>> ---
>> I actually change to module names in this patch now, and I had forgot to add that
>> into the commit message.
>
> I'm confused, there really isn't going to be 12 patches here in this new
> series, right?
>
> Care to start numbering them over and send them in a new thread so I can
> figure out what to apply in what order?
>
> thanks,
>
> greg k-h
>

Heh, sorry I didn't know what was easier for you.

-- 
GPG-Key: 9AFE00EA
