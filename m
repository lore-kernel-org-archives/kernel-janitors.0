From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 04 Jan 2018 21:41:08 +0000
Subject: Re: bonding: Completion of error handling around bond_update_slave_arr()
Message-Id: <892dbd56-ec95-8244-540a-cbd53db62ec7@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6cdc726b-82bc-85b6-393b-0e2002c19341@users.sourceforge.net>
 <CAF2d9jhjL7pbcsEzwXRxLVzyMid5s2OY96AwSyRTuuqho-w_EQ@mail.gmail.com>
 <f93750d3-700f-897d-c4ef-2cf5b5a3374e@users.sourceforge.net>
 <CAF2d9jh1EHUx3BzWghBWRAZt4acO6W-_eUXtD7dk2YBJZfuwsg@mail.gmail.com>
 <4af2b714-245a-0f0d-5982-818d5f81cade@users.sourceforge.net>
 <CAF2d9jjyfWT8Nm1V3fCKSrEE4Xs9gShs7nvj+dAYqXg42kUhvg@mail.gmail.com>
In-Reply-To: <CAF2d9jjyfWT8Nm1V3fCKSrEE4Xs9gShs7nvj+dAYqXg42kUhvg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: =?UTF-8?B?TWFoZXNoIEJhbmRld2FyICjgpK7gpLngpYfgpLYg4KSs4KSC4KSh4KWH4KS1?= =?UTF-8?B?4KS+4KSwKQ==?= <maheshb@google.com>, linux-netdev <netdev@vger.kernel.org>
Cc: Andy Gospodarek <andy@greyhouse.net>, Jay Vosburgh <j.vosburgh@gmail.com>, Veaceslav Falico <vfalico@gmail.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>>> If you see 8 out of 9 call sites in this file ignore the return value.
>>
>> How do you think about to fix error detection and corresponding
>> exception handling then?
>>
> If I understand your question correctly - not having memory is not a
> correctable error

I am unsure if it would be feasible to retry memory allocations for
this software module under other circumstances.


> and hence there are consequences.

Could one consequence be to let the error code “-ENOMEM” move through
the function call hierarchy?

Regards,
Markus
