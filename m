From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Tue, 15 Jul 2014 20:05:54 +0000
Subject: Re: [PATCH V4 4/6] staging: vt6556: Remove typedefs
Message-Id: <CA+MoWDobyMvP_LW+FmW+xjE5SRjx7mEDybVLc+fF5XuUweuyEA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1405365333-17170-1-git-send-email-peter.senna@gmail.com>
	<1405365333-17170-4-git-send-email-peter.senna@gmail.com>
	<20140715150609.GA18174@kroah.com>
In-Reply-To: <20140715150609.GA18174@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Forest Bond <forest@alittletooquiet.net>, Malcolm Priestley <tvboxspy@gmail.com>, devel@driverdev.osuosl.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Tue, Jul 15, 2014 at 5:06 PM, Greg KH <gregkh@linuxfoundation.org> wrote:
> On Mon, Jul 14, 2014 at 09:15:31PM +0200, Peter Senna Tschudin wrote:
>> This patch removes uneeded typedefs reported by chackpatch and removes
>> one enum. The removed enum from card.h:
>>
>> typedef enum _CARD_PHY_TYPE {
>>     PHY_TYPE_AUTO = 0,
>>     PHY_TYPE_11B,
>>     PHY_TYPE_11G,
>>     PHY_TYPE_11A
>> } CARD_PHY_TYPE, *PCARD_PHY_TYPE;
>
> Why did you remove this?
Unlike the other two enums this patch change, this one is not in use.
As checkpatch complained about the typedef and it is not currently in
use, I removed it.

>



-- 
Peter
