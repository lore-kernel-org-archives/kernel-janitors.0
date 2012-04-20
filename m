From: Kalle Valo <kvalo@adurom.com>
Date: Fri, 20 Apr 2012 18:14:44 +0000
Subject: Re: [patch] wireless: at76c50x: allocating too much data
Message-Id: <87vcku9sob.fsf@purkki.adurom.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120420064705.GE22649@elgon.mountain>
	<CAGRGNgVgtAYknmpB_8Q0OpcUWFjTxBistG+RNs1ORDZeckGsWw@mail.gmail.com>
	<20120420091449.GI27101@mwanda>
In-Reply-To: <20120420091449.GI27101@mwanda> (Dan Carpenter's message of "Fri,
	20 Apr 2012 12:14:49 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Julian Calaby <julian.calaby@gmail.com>, "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

> On Fri, Apr 20, 2012 at 06:57:00PM +1000, Julian Calaby wrote:
>> > -       struct mib_local *m = kmalloc(sizeof(struct mib_phy), GFP_KERNEL);
>> > +       struct mib_local *m = kmalloc(sizeof(struct mib_local), GFP_KERNEL);
>> 
>> Would it be better practice to use sizeof(*m)?
>> 
>
> That was my temptation as well...  But I decided to make it match
> with the surrounding code.  I'm happy to resend if people want.

IMHO sizeof(*m) is better and I tend to use it.

Related to this: I have a bad habit of sometimes dropping '*' from
sizeof()? Is there a tool which could spot that?

-- 
Kalle Valo
